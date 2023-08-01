# GPU-Accelerated Web Desktops

!!! warning "Experimental/Advanced Features"
    The method described below for accelerating desktop apps with a GPU is experimental, and may provide a degraded experience compared to the normal Exosphere web desktop. Notably, using TigerVNC's scraping server will likely break the web desktop's clipboard functionality. 

Scientific desktop software applications like QGIS, Metashape, VMD, ParaView, and Blender require a GPU to accelerate computation and screen rendering. Depending on the application and the complexity of the scene, this acceleration can yield incredible performance uplifts, especially when rendering in *real-time*. For example, consider this comparison of a simple real-time ParaView animation on a `g3.small` instance (viewed via Guacamole over a <abbr Title="~40 Mbps down / ~10 Mbps up, connected over 802.11ac Wi-Fi">residential internet connection</abbr>):

| CPU | GPU |
|-----|-----|
| ![](/images/guacamole-paraview-cpu.gif) | ![](/images/guacamole-paraview-gpu.gif) |

The graphical environment provided by the [Exosphere web desktop](../access-instance/#web-desktop-guacamole) is not configured to provide GPU-backed 2D & 3D rendering by default, instead relying on software (CPU rendering)--even if the instance is a GPU flavor.

This document only covers one setup; however, there are countless solutions on the topic. Further technologies of interest may include:

  - [VirtualGL](https://en.wikipedia.org/wiki/VirtualGL){target=_blank}
  - [Reemo](https://reemo.io/){target=_blank}
  - [TurboVNC](https://turbovnc.org/){target=_blank}
  - [KasmVNC](https://kasmweb.com/kasmvnc){target=_blank}
  - [Chrome Remote Desktop](https://remotedesktop.google.com/home){target=_blank}

---

## Configuring the Web Desktop for Native GPU Rendering

!!! note "Ubuntu 20 is not supported."
    Due to a lack of feature parity in the older version of `tigervnc-scraping-server` available for Ubuntu 20.04, these steps only support Ubuntu 22, Rocky Linux 8/9, and AlmaLinux 8/9. 

1. [Create an instance through Exosphere](create_instance.md), being sure to select a GPU flavor (`g3.x`) and enable the web desktop. 
2. Connect to the instance via the [web shell](../access-instance/#web-shell-guacamole) or [native SSH](../access-instance/#accessing-an-instance-with-native-ssh). Do **not** use the web desktop for these setup steps.
3. Grab and run the setup script as root (or follow the manual steps below): <br /> `curl -s "https://docs.jetstream-cloud.org/attachments/gpu-desktop-setup.sh" | sudo bash -s`

You should now notice that both the underlying [Xorg](https://en.wikipedia.org/wiki/X.Org_Server){target=_blank} server and any graphical apps launched on the web desktop are using the GPU:
```
exouser@your-cool-instance:~$ nvidia-smi
...

+-----------------------------------------------------------------------------+
| Processes:                                                                  |
|  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
|        ID   ID                                                   Usage      |
|=============================================================================|
|    0   N/A  N/A      8339      G   /usr/lib/xorg/Xorg                147MiB |
|    0   N/A  N/A      8495      G   /usr/bin/gnome-shell              121MiB |
|    0   N/A  N/A      9435      G   /usr/lib/firefox/firefox          193MiB |
+-----------------------------------------------------------------------------+
``` 

Note that the default resolution for this desktop is quite high (2560x1600), and you may want to adjust it for better performance and/or size scaling. This can be done by right-clicking on the desktop, then selecting `Display Settings`.

### Manual Setup Steps

1. Verify that your instance was launched with the web desktop enabled (`which gdm`) and has a working GPU (`nvidia-smi`)
2. Install the TigerVNC scraping server package:
```
# Ubuntu
sudo apt-get install -y tigervnc-scraping-server

# Rocky/Alma
sudo dnf install -y tigervnc-server
```

3. Create the configuration directory for Xorg if it doesn't already exist: `mkdir -p /etc/X11/xorg.conf.d`
4. `sudo touch /etc/X11/xorg.conf.d/00-xorg-js2.conf`
5. As root, open up `/etc/X11/xorg.conf.d/00-xorg-js2.conf` in your favorite text editor. Delete any existing contents, add the following lines, then save and exit:
```
Section "DRI"
        Mode 0666
EndSection

Section "Device"
        Identifier  "Card0"
        Driver      "nvidia"
        BusID       "PCI:4:0:0"
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
```

6. Kill the existing VNC server:
```
# Ubuntu
sudo systemctl stop vncserver@1.service && sudo systemctl disable vncserver@1.service

# Rocky/Alma
sudo systemctl stop vncserver@\:1.service && sudo systemctl disable vncserver@\:1.service
```

7. (As root) create a new file `/etc/systemd/system/x0vncserver.service` and fill in the following contents:
```
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
ExecStart=/usr/bin/x0vncserver -interface 172.17.0.1 -localhost=0 -rfbauth /home/exouser/.vnc/passwd -rfbport 5901 -display :0
ExecStop=/usr/bin/x0vncserver -kill :0
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
```

8. **(Only for Ubuntu)** Add a `-fg` flag to the `ExecStart` command. For example, `ExecStart=/usr/bin/x0vncserver -fg -interface 172.17.0.1 ...`.
9. Save the file and exit.
10. Restart the display manager: `sudo systemctl restart gdm`
11. Ensure that the current desktop session is logged in as exouser. The following command should return `/run/user/1001/gdm/Xauthority`. If not, try restarting GDM again or rebooting the instance.
```
ps aux | grep -m 1 "Xorg" | awk '{sub(/.*-auth /, ""); sub(/ .*/, ""); print}'
```
12. Start up the new VNC server:
```
sudo systemctl daemon-reload
sudo systemctl enable x0vncserver.service
sudo systemctl start x0vncserver.service
```