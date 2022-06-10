#Troubleshooting

Jetstream2 requires that you be on a [valid XSEDE allocation](https://portal.xsede.org/allocations/startup){target=_blank}. If you are having issues accessing the various Jetstream2 interfaces, please first verify that you're on a valid allocation via the [XSEDE User Portal](https://portal.xsede.org/group/xup/allocations/usage){target=_blank}

Troubleshooting Jetstream2 Interfaces:

  * [Exosphere](../ui/exo/troubleshooting.md)
  * [Cacao](../ui/cacao/troubleshooting.md)
  * [Horizon](../ui/horizon/troubleshooting.md)
  * [CLI](../ui/cli/troubleshooting.md)

---

General Troubleshooting:

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
