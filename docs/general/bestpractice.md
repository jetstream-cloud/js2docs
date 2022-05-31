# Best Practices for Jetstream2

Many of the best practices for using Jetstream2 are laid out in the [Security FAQ](../faq/security.md). These include such things as:

* Updating your virtual machines
* Running host-based firewalls
* Securing services

---

#### Using the latest Linux releases available on Jetstream2

Using the latest version of Ubuntu or RPM-based (e.g. CentOS, Rocky, Alma) Linux distribution is highly encouraged. While we do always maintain one revision back from the current release, we highly encourage people to use the most recent operating system that will meet their needs.

As such, we will also provide new Ubuntu and Rocky releases as they become available, are tested thoroughly, and are found to work with the Jetstream2 cloud. We will retire the oldest version as we bring the newest version into service.

---

#### Storage Best Practices

These were taken from [Ceph's Application Best Practices for Distributed File Systems document](https://docs.ceph.com/en/quincy/cephfs/app-best-practices/#application-best-practices-for-distributed-file-systems){target=_blank}

The brief summary is:

* Keep directories as small as possible -  breaking up data into chunks in multiple directories when possible.
* Don't do expensive operations like *stat* or other file metadata operations on large directories if you don't need to
* Use symlinks instead of hard links

**1. Running ls -l or other directory operations**

>When you run “ls -l”, the ls program is first doing a directory listing, and then calling stat on every file in the directory.
>
> This is usually far in excess of what an application really needs, and it can be slow for large directories. If you don’t really need all this metadata for each file, then use a plain ls.
>
>If another client is currently extending files in the listed directory, then an ls -l may take an exceptionally long time to complete, as the lister must wait for the writer to flush data in order to do a valid read of the every file’s size. So unless you really need to know the exact size of every file in the directory, just don’t do it!
>
>This would also apply to any application code that was directly issuing stat system calls on files being appended from another node.

**2. Very large directories**

>Do you really need that 10,000,000 file directory? While directory fragmentation enables CephFS to handle it, it is always going to be less efficient than splitting your files into more modest-sized directories.
>
>Even standard userspace tools can become quite slow when operating on very large directories. For example, the default behaviour of ls is to give an alphabetically ordered result, but readdir system calls do not give an ordered result (this is true in general, not just with CephFS). So when you ls on a million file directory, it is loading a list of a million names into memory, sorting the list, then writing it out to the display.

***We've found on Jetstream2 that more than 10,000 items in a single directory impacts performance and that in excess of 100,000 items in a single directory might cause unexpected behavior that could directly impact your VM operations as well as the operations of the Ceph store, potentially impacting ALL users.***
{: .note}

**3. Hard links**

>Hard links have an intrinsic cost in terms of the internal housekeeping that a file system has to do to keep two references to the same data. In CephFS there is a particular performance cost, because with normal files the inode is embedded in the directory (i.e. there is no extra fetch of the inode after looking up the path).
