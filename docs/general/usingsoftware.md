# Using the Jetstream2 Software Collection

Jetstream2 utilizes [Lmod](https://lmod.readthedocs.io/){target=_blank} to load and unload software you may need in your research or education pursuits. The software is served from a shared store utilizing Manila shares that are mounted automatically if you're using a Jetstream2 Featured Image.

### Listing available software from the collection

### Loading software from the collection

### Unloading software from the collection

### Manually adding the software collection to a non-featured virtual machine

Do the following as the root user:

Create the file **/etc/ceph.js2softwarero.secret** with the contents

    AQAYuStiw81/ABAAsvzI5h53WOC5K1vzmGB66g==

Make the mount point you want to use (we highly suggest it be **/software**)

    mkdir /software

Add the following entry to the end of your /etc/fstab (make sure the mountpoint you created in the last step matches)

> \# JS2 Software Collection mount
> ```149.165.158.38:6789,149.165.158.22:6789,149.165.158.54:6789,149.165.158.70:6789,149.165.158.86:6789:/volumes/_nogroup/b7112570-f7cb-4bd2-8c0e-39b08609b9fd/01aa9d72-69bf-4250-9245-2eaddcdb251d /software ceph name=js2softwarero,secretfile=/etc/ceph.js2softwarero.secret,x-systemd.device-timeout=31,x-systemd.mount-timeout=30,noatime,_netdev,ro 0
```

Then mount the filesystem within

    mount -a

If you then run a `df -h|grep vol` you should see something like this:

    > ```149.165.158.38:6789,149.165.158.22:6789,149.165.158.54:6789,149.165.158.70:6789,149.165.158.86:6789:/volumes/_nogroup/fe4f8ad4-2877-4e23-b5d3-46eb8476750b/ab404bac-9584-45f4-8a34-92dfc61fbb98   1.8T  134G  1.7T   2% /mnt/ceph
    ```
