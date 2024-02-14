#Troubleshooting

Jetstream2 requires that you be on a [valid ACCESS allocation](../alloc/overview.md){target=_blank}. If you are having issues accessing the various Jetstream2 interfaces, please first verify that you're on a valid allocation via the [ACCESS allocations summary page](https://allocations.access-ci.org/){target=_blank}

Troubleshooting Jetstream2 Interfaces:

  * [Exosphere](../ui/exo/troubleshooting.md)
  * [Cacao](../ui/cacao/troubleshooting.md)
  * [Horizon](../ui/horizon/troubleshooting.md)
  * [CLI](../ui/cli/troubleshooting.md)

---

## General Troubleshooting:

### My instance/image that was migrated to a bootable volume won't mount on Exosphere

Most instances that were migrated from Jetstream1 were partitioned whereas volumes on Jetstream2 are generally the entire device. What this means is that in almost all cases, migrated instances will have their information on */dev/sdb1* assuming it's the first volume you're attaching to an instance.

Exosphere, in the quest to keep things simple, only tries to mount the entire devices, e.g. */dev/sdb*, which means it won't find the data on /dev/sdb1.

The best way to work around this is to use Horizon to attach the volume and then do

    sudo mount /dev/sdb1 /mnt

and you'll be able to see the contents of the volume in /mnt

### Ubuntu 22 Snaps: "not a snap cgroup"

When attempting to launch applications that rely on [Snaps](https://ubuntu.com/core/services/guide/snaps-intro) you may receive something similar to the following error message:
```
/user.slice/user-1001.slice/session-5.scope is not a snap cgroup
```
This is a known issue with the Ubuntu 22 distribution. You can read about the bug report and its status in [this Ubuntu launchpad](https://bugs.launchpad.net/ubuntu/+source/snapd/+bug/1951491). Software delivered via snap may not be reliable at this time, especially web browsers and other graphical applications.

For the time being, the only known workaround is to install software via other means if possible; for example, with `apt`, a `.deb` file, or built from source.

---

## Resolved Issues:

The following are solutions to historical known issues (now resolved), preserved for the sake of archival:

### In Ubuntu 20 or 22 web desktop, I can't load items from the JS2 Software Collection.

This issue should only affect instances created on or before June 10th, 2022, and has been resolved in current featured images.
{: .note}

The [Jetstream2 Software Collection](../general/software.md) requires `Lmod` modules to work. By default, the Gnome terminal in the the Ubuntu web desktop did not act like a login shell -- meaning it didn't source the normal Bash login/environment files setting up your path and other environment variables.

You may be able to fix this in the terminal preferences.

With Terminal as the active application:

* Go to Edit -> Profile Preferences.
* Select the "Unnamed" Profile
* Select the ***Title and Command*** tab.
* Check the "Run command as login shell" checkbox

You'll need to start a new terminal window, but that new session should allow you to do commands like `module avail`

### Firefox doesn't work in Ubuntu 22

This issue should only affect instances created on or before October 10th, 2022, and has been resolved in current featured images.
{: .note}

This was a known issue with the Ubuntu 22 distribution, related to the above: [Ubuntu 22 Snaps: "not a snap cgroup"](#ubuntu-22-snaps-not-a-snap-cgroup)

If you are affected, the only easy workaround is to use another web browser. You can install Chrome from a terminal command line as one possibility:

    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

    sudo apt install ./google-chrome-stable_current_amd64.deb

Chrome can also be launched from the command-line by typing `google-chrome`. You can also launch it from the activity bar.

### I can't ping or reach a public/floating IP from an internal, non-routed host

This as a change in the network between Jetstream 1 and 2. You cannot presently ping a floating IP address from  internal, non-routable IPs. You can only to talk from non-routed nodes to bastion hosts and floating IPs only work from other routable hosts.

To communicate from an internal only Jetstream2 instance to an instance on Jetstream2 with a floating IP, you'll need to use the internal networking address or name.
