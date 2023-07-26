#!/bin/bash

##### Begin sanity checks to make sure things are supported
if [ -f /etc/os-release ]; then
    . /etc/os-release
else
        echo "Couldn't detect OS! Does your distro have an /etc/os-release file?"
        exit 1
fi

if [ "$ID" == "ubuntu" ]; then
        if [ "$VERSION_CODENAME" != "jammy" ]; then
                echo "Only Ubuntu 22 (jammy) is supported. Are you on Ubuntu 20?"
                exit 1
        fi
elif [[ "$ID_LIKE" == *"rhel"* ]]; then
        if [[ $VERSION_ID < 8 ]]; then 
                echo "Only RHEL-like 8+ is supported. CentOS 7 is not supported."
                exit 1
        fi
else
        echo "Unknown or unsupported OS."
        exit 1
fi

if ! nvidia-smi > /dev/null; then
	echo "nvidia-smi failed. Are you sure this is a GPU instance?"
	exit 1
else
	echo "GPU sanity check passed. Continuing..."
fi

if [ "$EUID" -ne 0 ]; then
	echo "This script needs to be run as root."
	exit 1
fi
##### End sanity checks

# Dependency needed for Ubuntu 22 (x0vncserver already packaged on RHEL)
if [ "$ID" == "ubuntu" ]; then
        apt-get install -y tigervnc-scraping-server
fi

# Make the Xorg conf.d directory if it doesn't already exist
mkdir -p /etc/X11/xorg.conf.d

# Place a valid configuration file that tells Xorg to use our NVIDIA GPU and driver
cat << EOF > /etc/X11/xorg.conf.d/00-xorg-js2.conf
Section "DRI"
        Mode 0666
EndSection

Section "Device"
        Identifier  "Card0"
        Driver      "nvidia"
        BusID       "$(nvidia-xconfig --query-gpu-info | grep BusID | sed "s/.*BusID : //")"
EndSection

Section "Monitor"
    Identifier     "Monitor0"
    VendorName     "Unknown"
    ModelName      "Unknown"
    Option         "DPMS" "False"
EndSection

Section "Screen"
        Identifier "Screen0"
        Device     "Card0"
        Monitor    "Monitor0"
        SubSection "Display"
                Viewport   0 0
                Depth     24
        EndSubSection
EndSection

EOF

# Create a service for x0vncserver to run in the background
cat << EOF > /etc/systemd/system/x0vncserver.service
[Unit]
Description=TigerVNC Scraping Server
BindsTo=sys-devices-virtual-net-docker0.device
After=syslog.target network.target sys-devices-virtual-net-docker0.device gdm.service
StartLimitIntervalSec=300
StartLimitBurst=5

[Service]
Type=simple
User=exouser
PAMName=login
PIDFile=/home/exouser/.vnc/%H0.pid
Environment="XAUTHORITY=/run/user/1001/gdm/Xauthority"
ExecStartPre=/bin/sh -c 'ip address show dev docker0 | grep -q 172.17.0.1'
ExecStartPre=-/usr/bin/x0vncserver -kill :0
ExecStart=/usr/bin/x0vncserver $([ "$ID" == "ubuntu" ] && echo "-fg") -interface 172.17.0.1 -localhost=0 -rfbauth /home/exouser/.vnc/passwd -rfbport 5901 -display :0
ExecStop=/usr/bin/x0vncserver -kill :0
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target

EOF


systemctl daemon-reload

# Stop and disable the existing (old) VNC server
systemctl stop $([[ "$ID_LIKE" == *"rhel"* ]] && echo "vncserver@\:1" || echo "vncserver@1")
systemctl disable $([[ "$ID_LIKE" == *"rhel"* ]] && echo "vncserver@\:1" || echo "vncserver@1")

# Restart the display manager so it can start an autologin session
echo "Restarting GDM..."
systemctl restart gdm
# Give it time for the session to start again
sleep 10

gdm_xauth=$(ps aux | grep -m 1 "Xorg" | awk '{sub(/.*-auth /, ""); sub(/ .*/, ""); print}')
if [ $gdm_xauth != "/run/user/1001/gdm/Xauthority" ]; then
        echo "Trying second GDM restart with longer waiting time..."
        systemctl restart gdm
        sleep 30
fi

# Enable and start the new service
echo "Enabling x0vncserver service..."
systemctl enable x0vncserver
systemctl start x0vncserver

sleep 5

if [ $(systemctl is-active x0vncserver.service) != "active" ]; then
        echo "x0vncserver service failed! Attempting restart with 60s wait..."
        systemctl restart gdm
        systemctl stop x0vncserver
        systemctl disable x0vncserver
        sleep 60
        systemctl enable x0vncserver
        systemctl start x0vncserver
        if [ $(systemctl is-active x0vncserver.service) != "active" ]; then
                echo "x0vncserver service failed again! Aborting."
                exit 1
        fi
fi
echo "x0vncserver service running!"
exit 0
