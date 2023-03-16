# Using Storage Under the CLI

All allocations receive 1 TB of storage alloation by default. You can use this storage quota in the form of volumes or [manila shares](/ui/cli/manila.md).

All of the commands below assume that you have an [Openstack Client](clients.md) installed and a working [openrc](auth.md) file.

To view any volumes you might have:

    openstack volume list

To create a 10 GB volume, you can do:

    openstack volume create --size 10 my-10GVolume

Then you can attach it to an instance for use:

    openstack server add volume VM-Name-Or-UUID Volume-Name-Or-UUID

While you can usually assume it will be the next mounted disk (root should be /dev/sdaX in all cases on Jetstream2), you can look on your instance to see where the volume attached by doing:

    dmesg | grep sd

The output of that should usually look something like this:


```
[root@my-vm ~]# dmesg | grep sd
[    1.715421] sd 2:0:0:0: [sda] 16777216 512-byte logical blocks: (8.58 GB/8.00 GiB)
[    1.718439] sd 2:0:0:0: [sda] Write Protect is off
[    1.720066] sd 2:0:0:0: [sda] Mode Sense: 63 00 00 08
[    1.720455] sd 2:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    1.725878]  sda: sda1
[    1.727563] sd 2:0:0:0: [sda] Attached SCSI disk
[    2.238056] XFS (sda1): Mounting V5 Filesystem
[    2.410020] XFS (sda1): Ending clean mount
[    7.997131] Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
[    8.539042] sd 2:0:0:0: Attached scsi generic sg0 type 0
[    8.687877] fbcon: cirrusdrmfb (fb0) is primary device
[    8.719492] cirrus 0000:00:02.0: fb0: cirrusdrmfb frame buffer device
[  246.622485] sd 2:0:0:1: Attached scsi generic sg1 type 0
[  246.633569] sd 2:0:0:1: [sdb] 20971520 512-byte logical blocks: (10.7 GB/10.0 GiB)
[  246.667567] sd 2:0:0:1: [sdb] Write Protect is off
[  246.667923] sd 2:0:0:1: [sdb] Mode Sense: 63 00 00 08
[  246.678696] sd 2:0:0:1: [sdb] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[  246.793574] sd 2:0:0:1: [sdb] Attached SCSI disk
```

From your instance, you can now create a mount point, view the device, and create the filesystem (using ext4 as the filesystem type for this example).

    mkdir /vol_b
    fdisk -l /dev/sdb
    mkfs.ext4 /dev/sdb 

If you get the following warning, it's safe to hit 'y' to proceed. 

    /dev/sdb is entire device, not just one partition!
    Proceed anyway? (y,n)

    mount -o noatime /dev/sdb /vol_b

Assuming you didn't get any errors, /dev/sdb should now be mounted on /vol_b

> _Note: Linux has a special mount option for file systems called noatime. If this option is set for a file system in /etc/fstab, then reading accesses will no longer cause the atime information (last access time - don't mix this up with the last modified time - if a file is changed, the modification date will still be set) that is associated with a file to be updated (in reverse this means that if noatime is not set, each read access will also result in a write operation). Therefore, using noatime can lead to significant performance gains._
{: .note}

```
[root@my-vm ~]# touch /vol_b/foo
[root@my-vm ~]# ls -la /vol_b/
total 24
drwxr-xr-x   3 root root  4096 Jul 13 13:37 .
dr-xr-xr-x. 18 root root  4096 Jul 13 11:50 ..
-rw-r--r--   1 root root     0 Jul 13 13:37 foo
drwx------   2 root root 16384 Jul 13 13:36 lost+found

[root@my-vm ~]# df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1       8.0G  2.4G  5.7G  30% /
devtmpfs        902M     0  902M   0% /dev
tmpfs           920M     0  920M   0% /dev/shm
tmpfs           920M   17M  904M   2% /run
tmpfs           920M     0  920M   0% /sys/fs/cgroup
tmpfs           184M     0  184M   0% /run/user/0
/dev/sdb        9.8G   37M  9.2G   1% /vol_b
```


To make the volume mount persist, you can add an entry to /etc/fstab similar to this:

    /dev/sdb /vol_b ext4 defaults,noatime 0 0

You would need to change as needed for a different device id, mount point, and file system type. We do recommend using the _**noatime**_ option as shown in the example.

Once you are done with your volume or want to use it with another VM, if you are not shutting down the VM, you'll need to unmount it. 

    umount /vol_b

To detach it from the VM, you'll do:

    openstack server remove volume VM-Name-Or-UUID Volume-Name-Or-UUID

Doing an _openstack volume list_ now should show the volume as available:

```
+--------------------------------------+------------------+------------+------+------------------------------+
|  ID                                  |   Display Name   |  Status    | Size | Attached to                  |
+--------------------------------------+------------------+------------+------+------------------------------+
| af59d4fa-ced2-4049-a062-7b2a15807b7f | my-10GVolume     | available  |  10  |                              |
+--------------------------------------+------------------+------------+------+------------------------------+
```

If you want to completely destroy a volume, you can do:

    openstack volume delete Volume-Name-Or-UUID
