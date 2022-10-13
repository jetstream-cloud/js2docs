#Troubleshooting

Jetstream2 requires that you be on a [valid ACCESS allocation](../alloc/overview.md){target=_blank}. If you are having issues accessing the various Jetstream2 interfaces, please first verify that you're on a valid allocation via the [ACCESS allocations summary page](https://allocations.access-ci.org/allocations/summary){target=_blank}

Troubleshooting Jetstream2 Interfaces:

  * [Exosphere](../ui/exo/troubleshooting.md)
  * [Cacao](../ui/cacao/troubleshooting.md)
  * [Horizon](../ui/horizon/troubleshooting.md)
  * [CLI](../ui/cli/troubleshooting.md)

---

## General Troubleshooting:

### In Ubuntu 20 or 22 web desktop, I can't load items from the JS2 Software Collection.

The [Jetstream2 Software Collection](../general/software.md) requires `Lmod` modules to work. By default, the Gnome terminal in the the Ubuntu web desktop does not act like a login shell -- meaning it doesn't source the normal Bash login/environment files setting up your path and other environment variables.

We're looking for a longer term solution for this, but in the meantime, you can fix this in the terminal preferences.

With Terminal as the active application:

* Go to Edit -> Profile Preferences.
* Select the "Unnamed" Profile
* Select the ***Title and Command*** tab.
* Check the "Run command as login shell" checkbox

You'll need to start a new terminal window, but that new session should allow you to do commands like `module avail`

---

### There is a known issue with suspending GPU instances

We will update this [Status IO Incident](https://jetstream.status.io/pages/incident/61dc808a7e9a82053ce739d2/629a6de486604112e598b390){target=_blank} with details/

There is an issue/bug with suspending GPU instances with the version of libvirt Jetstream2 is using for virtualization.

!!! danger ""

    DO NOT SUSPEND GPU instances.

We will have to upgrade the compute nodes to resolve it. This is on the near-term timeline but we do not have a precise date at this time.

In the meantime, please only use stop or shelve with GPU instances.

### I can't ping or reach a public/floating IP from an internal, non-routed host

This as a change in the network between Jetstream 1 and 2. You cannot presently ping a floating IP address from  internal, non-routable IPs. You can only to talk from non-routed nodes to bastion hosts and floating IPs only work from other routable hosts.

To communicate from an internal only Jetstream2 instance to an instance on Jetstream2 with a floating IP, you'll need to use the internal networking address or name.


### Firefox doesn't work in Ubuntu 22

This is a known issue with the Ubuntu 22 distribution. You can read about the bug report and its status [in this Ubuntu launchpad](https://bugs.launchpad.net/ubuntu/+source/snapd/+bug/1951491){target=_blank}

The only easy work around for the moment is to use another web browser. You can install Chrome from a terminal command line as one possibility:

    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

    sudo apt install ./google-chrome-stable_current_amd64.deb

Chrome can also be launched from the command-line by typing `google-chrome`. You can also launch it from the activity bar.

As soon as Ubuntu releases a fix for this we will update the featured image.

Another option if you do prefer Firefox is to use Ubuntu 20.

### My instance/image that was migrated to a bootable volume won't mount on Exosphere

Most instances that were migrated from Jetstream1 were partitioned whereas volumes on Jetstream2 are generally the entire device. What this means is that in almost all cases, migrated instances will have their information on */dev/sdb1* assuming it's the first volume you're attaching to an instance.

Exosphere, in the quest to keep things simple, only tries to mount the entire devices, e.g. */dev/sdb*, which means it won't find the data on /dev/sdb1.

The best way to work around this is to use Horizon to attach the volume and then do

    sudo mount /dev/sdb1 /mnt

and you'll be able to see the contents of the volume in /mnt

### My GPU is not usable after a kernel update

The NVIDIA drivers are built as kernel modules and ***should*** rebuild on a kernel update. If they do not, you can do this on Ubuntu-based instances:

    ls /var/lib/initramfs-tools | sudo xargs -n1 /usr/lib/dkms/dkms_autoinstaller start

This doesn't work on redhat-based instances like Rocky or Alma. We're working on a simple solution for that. 
