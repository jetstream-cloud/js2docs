# Using Storage Under Horizon

### Volumes

Small virtual filesystems that may be attached to the Users running/active Instances.</br>
Files/data saved to a Volume are maintained across successive attachment/detachment actions to the User’s Instances.</br>
On the left side bar, click on `Project` → `Volumes` →  `Volumes`.


---

![](/images/horizon_volume_create_empty.png){ align=right ; width=50% }

1. `Create Volume`

* Click `+Create Volume`
* **Volume Name**: Choose short name for your volume, e.g. `<username>_data`
* **Description**: Briefly describe the volume contents
* **Volume Source**: There are two options, `empty` and `image`
    * `empty`: creates a blank volume of the specified size
    * `image`: uses an existing `image` as a template for a new volume. Select from available `images`
* **Size**: modify the size of the size of the volume.</br>***All volumes count against the project's storage quota***
* Click `Create Volume`

![](/images/horizon_volume_create_image.png){ align=right ; width=30% }

</br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br>

---

![](/images/horizon_volume_actions.png){ align=right ; width=25% }

2. `Attach Volume`

* Click `Manage Attachments` for the desired volume
* Select an instance to attach to, and click `Attach Volume`
![](/images/horizon_volume_manage_attachments.png){ align=right ; width=50% }

</br></br></br></br></br></br></br></br></br></br></br></br></br>

![](/images/horizon_volume_attached-to.png){ align=right ; width=25% }

* The **device** on a particular **instance** will now be listed in the `Attached To` column
* `ssh` to your instance, create any filesystems as needed, create a mountpoint, and mount the volume.
    * ssh: `ssh ubuntu@ip`
    * check if device is attached: `sudo fdisk -l <device>`, often `/dev/sdb`
    * if new disk, create filesystem: `sudo mkfs.ext4 <device>`
    * create a mountpoint: `sudo mkdir -p <path>`, e.g. `/mnt/vol_b`
    * mount the volume: `sudo mount -o noatime <device> <path>`, e.g. `sudo mount -o noatime /dev/sdb /mnt/vol_b`
    * check the mount:<br/>
        ```
        ubuntu@test-horizon-tiny:~$ df -kh /mnt/vol_b
        Filesystem      Size  Used Avail Use% Mounted on
        /dev/sdb         98G   24K   93G   1% /mnt/vol_b
        ```
    * you may need to change the permissions to make the volume accessible: `sudo chown ubuntu.ubuntu /mnt/vol_b`
    * To make the volume mount persist, you can add an entry to `/etc/fstab` similar to this::<br/>
        `/dev/sdb /mnt/vol_b ext4 defaults,noatime 0 0`


</br></br></br></br></br></br>

---

![](/images/horizon_volume_actions.png){ align=right ; width=25% }

3. `Detach Volume`

* `ssh` to your instance and unmount the volume:
    * ssh: `ssh ubuntu@ip`
    * unmount: `sudo umount /mnt/vol_b`
* In Horizon `Project` → `Volumes` →  `Volumes`, click `Manage Attachments` for the desired volume
* Select an instance, and click `Detach Volume`
* Confirm `Detach Volume`
![](/images/horizon_volume_manage_detach.png){ align=right ; width=50% }


</br></br></br></br></br></br></br></br></br></br></br>


---

![](/images/horizon_volume_actions.png){ align=right ; width=25% }

4. `Delete Volume`

* In Horizon `Project` → `Volumes` →  `Volumes`, click `Actions` for the desired volume
* Click `Delete Volume`
* Confirm your selection.

    !!! warning ""

        ***Deleted volumes are not recoverable. All data stored in the volume will be removed.***

* Confirm `Delete Volume`



</br></br></br></br></br></br></br></br>
