#Troubleshooting

Jetstream2 requires that you be on a [valid XSEDE allocation](https://portal.xsede.org/allocations/startup){target=_blank}. If you are having issues accessing the various Jetstream2 interfaces, please first verify that you're on a valid allocation via the [XSEDE User Portal](https://portal.xsede.org/group/xup/allocations/usage){target=_blank}

Troubleshooting Jetstream2 Interfaces:

  * [Exosphere](../ui/exo/troubleshooting.md)
  * [Cacao](../ui/cacao/troubleshooting.md)
  * [Horizon](../ui/horizon/troubleshooting.md)
  * [CLI](../ui/cli/troubleshooting.md)

---

General Troubleshooting:

### In Ubuntu 20 web desktop, I can't load items from the JS2 Software Collection.

The [Jetstream2 Software Collection](../general/software.md) requires Lmod modules to work. By default, the Gnome terminal in the the Ubuntu web desktop does not act like a login shell -- meaning it doesn't source the normal Bash login/environment files setting up your path and other environment variables.

We're looking for a longer term solution for this, but in the meantime, you can fix this in the terminal preferences.

In a newly launched terminal in the Web Desktop, do `source .bashrc` should allow you to do commands like *module avail*

---
