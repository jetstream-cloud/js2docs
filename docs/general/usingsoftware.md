# Using the Jetstream2 Software Collection

Jetstream2 utilizes [Lmod](https://lmod.readthedocs.io/){target=_blank} to load and unload software you may need in your research or education pursuits. The software is served from a shared store utilizing Manila shares that are mounted automatically if you're using a Jetstream2 Featured Image.

All of the instructions on listing, loading, and unloading modules/software packages assume you are using a Jetstream2 featured image created after April 9, 2022.

Additional information on using Lmod is available in the [User Guide for Lmod](https://lmod.readthedocs.io/en/latest/010_user.html){target=_blank}

### Listing available software from the collection

You can use ***module avail*** to show available software packages. This may show multiple versions of the same package in the future, which will default to the latest version but allow you to load previous versions.

    [exouser@rocky-lmod-host ~]$ module avail

    ---------------- /software/r8/modulefiles ------------------
      R/4.1.2 (L)    intel-OneAPI/2022.1.2       matlab/R2021a

    ---------------- /usr/share/lmod/lmod/modulefiles/Core -----
      lmod    settarg

      Where:
      L:  Module is loaded

### Loading software from the collection

You can load software from the collection using ***module load***.

    [exouser@rocky-lmod-host ~]$ module load R

You can also explicitly load a version if there is more than one:

    [exouser@rocky-lmod-host ~]$ module load R/4.1.2

### See what modules are loaded

You can use ***module list*** to show what's loaded:

    [exouser@rocky-lmod-host ~]$ module list

    Currently Loaded Modules:
      1) R/4.1.2   2) intel-OneAPI/2022.1.2

### Saving your loaded software from the collection

You can save the current loaded modules so it will automatically load every time you log in to your virtual machine by using ***module save***. This will save to a file called *default* in and *~/.lmod.d* directory that Lmod will create the first time you save your loaded module list.

You'll need to do this on any new virtual machine.

### Unloading software from the collection

You can also unload any loaded modules by using ***module unload***

    [exouser@rocky-lmod-host ~]$ module list

    Currently Loaded Modules:
      1) R/4.1.2   2) intel-OneAPI/2022.1.2

    [exouser@rocky-lmod-host ~]$ module unload R

    [exouser@rocky-lmod-host ~]$ module list

    Currently Loaded Modules:
      1) intel-OneAPI/2022.1.2

    [exouser@rocky-lmod-host ~]$

----

#### Manually adding the software collection to a non-featured virtual machine

This is an advanced topic for researchers and educators that are more comfortable with the system administration aspects of Linux. We generally advise using the Featured Images that have the mounts and Lmod already configured for you.
{: .note}

Do the following as the root user:

Create the file **/etc/ceph/ceph.client.js2softwarerw.keyring** with the contents

    AQAYuStiw81/ABAAsvzI5h53WOC5K1vzmGB66g==

Make the mount point you want to use (we highly suggest it be **/software**)

    mkdir /software

Add the following entry to the end of your /etc/fstab (make sure the mountpoint you created in the last step matches)

> \# JS2 Software Collection mount
>
```
149.165.158.38:6789,149.165.158.22:6789,149.165.158.54:6789,149.165.158.70:6789,149.165.158.86:6789:/volumes/_nogroup/b7112570-f7cb-4bd2-8c0e-39b08609b9fd/01aa9d72-69bf-4250-9245-2eaddcdb251d /software ceph name=js2softwarero,x-systemd.device-timeout=31,x-systemd.mount-timeout=30,noatime,_netdev,ro 0 0
```

Then mount the filesystem with

    mount -a

If you then run a `df -h|grep vol` you should see something like this:

>
```
 149.165.158.38:6789,149.165.158.22:6789,149.165.158.54:6789,149.165.158.70:6789,149.165.158.86:6789:/volumes/_nogroup/fe4f8ad4-2877-4e23-b5d3-46eb8476750b/ab404bac-9584-45f4-8a34-92dfc61fbb98   1.8T  134G  1.7T   2% /mnt/ceph
```

You'll also need to install Lmod on your VM. The major distributions include this either in default software repositories or in the Powertools repo for CentOS/Alma/Rocky8.

You'll need to point your modulepath config to:

    /software/xx/modulefiles

replacing the `xx` with `u22`,`u20`, or `r8` depending on the Linux variant you're using.
