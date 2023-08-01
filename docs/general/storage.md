# Storage

Jetstream2 (JS2) supports a number of different methods for data storage, including:

* [Volumes](#Volumes): mountable block storage
* [Manila](/general/manila): Filesystems-as-a-service
* [Object Store](/general/object): experimental Openstack Swift and S3 storage

---

## Volumes <a name="Volumes"></a>

**Volumes**: Small virtual filesystems that may be attached to the Users running/active Instances.

Files/data saved to a Volume are maintained across successive attachment/detachment actions to the User's Instances.

Volume actions (method varies per interface):

* **Creation**
* **Attachment** to an active Instance
* **Detachment**
* **Backup**

!!! note "Detaching Volumes"

    **REMINDER**: Volumes can only be detached if:

    1. they are not in active use by a process on the instance
       Try:
           * `fuser -m /<volume>`  to LIST all processes using a volume
               * You might also try `sudo fuser -m /volume` if nothing comes up – this will check for root processes holding the volume open
           * `fuser -km /<volume>` to KILL all processes using a volume
               * If you get results with sudo above, you'll need to do `sudo fuser -km /<volume>` to kill the processes
    2. the instance to which they are attached is active
           * `sudo lsof /<volume>` will also show you processes using the volume.


### Cost and Size:

While Volumes are available to facilitate research, Jetstream2 is not primarily a storage service; large capacity storage is beyond the scope of Jetstream2.

Projects are limited to 10 volumes with an aggregate capacity of 1 TB by default. Adjustment of **volume count quotas** can be requested via [the Jetstream2 contact form](https://jetstream-cloud.org/contact/index.html){target=_blank}; however, storage capacity is an ACCESS-allocated resource (as noted on *[Jetstream2 Resources](resources.md)*). As with any allocated resource, Jetstream2 storage carries its own "balance" independent of your project's other amounts (including compute SU balances), and the proper way to request an allocation on this resource is through an ACCESS [exchange request](https://allocations.access-ci.org/use-credits-overview){target=_blank} or [supplement](../alloc/supplement.md).

For more information about exchange rates and planning, see *[Budgeting for Common Usage Scenarios](../../alloc/budgeting/#storage)*.

### Project and Providers:

As with Instances, Volumes are associated/organized with Projects and with particular regional Providers (e.g. IU, TACC, UH, Cornell, ASU).
    (i.e. you cannot attach a Volume from one Provider to an instance on a different Provider.)

### Sharing:

Generally, Volumes may be attached to one active Instance at a time.

You can’t easily share volumes in OpenStack without deploying a **Shared File System service**. However, the native OpenStack [Manila - Filesystems-as-a-service](/general/manila/) option is available.

Volumes may also be shared using standard methods (e.g. NFS) to other active Instances within Jetstream.

!!! note "Storage Quotas"

    There are different quotas for block storage (volumes) and shares. There will be a self-service tool for managing those quotas soon, but for now, if you need to have your Jetstream2 Storage quota adjusted between block and share storage, please [contact us via the Jetstream2 contact form](https://jetstream-cloud.org/contact/index.html){target=_blank} with the amount you wish to move between the storage types.


### Backup & Exporting:

Users should regularly backup (via `ssh`, `rsync`, `tar`, or the like: see [File Transfer](/general/filetransfer)) any critical data contained on Volumes as no automated backup functions are currently provided by Jetstream. 
