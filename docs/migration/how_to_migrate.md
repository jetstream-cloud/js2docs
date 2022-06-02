## How to Migrate

### Overview
In order to migrate from Jetstream1 (JS1) to Jetstream2 (JS2) you'll need to understand:

* [Allocations](#Allocations)
* [How to move data](#MoveData)
* [Where to find help](#GetHelp)

### Allocations <a name="Allocations"></a>

Just as in JS1, you'll need an allocation of compute (normal, large memory, GPU) and storage resources, awarded by NSF and currently managed by [XSEDE](https://portal.xsede.org).
The allocation process is described here: [Allocation Overivew](/alloc/overview/)

You can take one of two approaches:

1. A supplement to a current research allocation -OR-
2. A completely new allocation.

### Supplement Allocation <a name="Supplement"></a>

If you already have a JS1 allocation, then we encourage you to request a supplement a **[STARTUP](/alloc/startup/)** amount of resources for the compute, large-memory-compute, GPU, and storage resources on JS2. This will enable you to create the **Code, Performance, & Scaling** estimates you'll need for a successful project renewal on JS2.

* [SUPPLEMENT](/alloc/supplement/)
* [RENEWAL](/alloc/renew-extend/)

### New Allocation <a name="NewAllocation"></a>

Of course, if your research will be changing, you can always apply for a new allocation of resources on JS2. We recommend you still start with a STARTUP level in order to create the **Code, Performance, & Scaling** estimates you'll need later.

* [ALLOCATION OVERVIEW](/alloc/overview/)
* [STARTUP ALLOCATION](/alloc/startup)


### How to move your data <a name="MoveData"></a>

If you've already been using JS1, you'll likely wish to retain your old VMs and data, found within both VMs and in external volumes.

#### Three approaches
There are essentially three approaches to accomplish this:

1. **Recreate your work**</br>
In order to get you going the fastest, take advantage of all the new features of JS2, and avoid any legacy configuration differences, it’s often advisable to simply create new VMs and bring in fresh software and data.</br></br>
Information about creating new VMs can be found for each type of user inteface: [General Instance Management](/general/instancemgt) </br></br> while instructions for tansfering files from external locations to JS2 VMs can be found here: [File Transfer](/general/filetransfer)

2. **Copy your JS1 work**</br>
Similar to recreating your work, you can save some steps after [starting new VMs](/general/instancemgt) by copying your existing software from your current VM on JS1: [File Transfer](/general/filetransfer) </br></br> **A NOTE OF WARNING**: network configurations and any instance management tools and scripts you’ve used previously will likely require updating to current values appropriate for JS2. </br></br>
Copying data from JS1 to JS2, particularly from within the same regional provider, will generally have good performance relative to a transfers across the internet.

3. **Transfer your work** </br>
You can create snapshots of your existing JS1 VMs and request the [Help Desk Support](mailto:help@jetstream-cloud.org) team copy these snapshots as well as data volumes to Jetstream2.

 * **Data volumes**:</br>
 This is fairly straightforward and is described below: [How to preserve JS1 VMs and data](#SaveData)</br>
 * **VMs**:</br>
 While you can also follow the steps at [How to preserve JS1 VMs and data](#SaveData), please be aware that configurational differences between JS1 and JS2 generally prevent straight forward re-deployment of a JS1 VM on JS2. It may be more advisable to transfer the VM and mount the snapshot as a external volume on a new JS2 VM.

### How to preserve Jetstream1 VMs and data <a name="SaveData"></a>
1. Identify if your VM or volume used the Atmosphere or API/CLI interface
    * **Atmosphere**:</br>
      * VMs:
        1. Follow the instructions here to [update and image your VM](https://wiki.jetstream-cloud.org/Customizing+and+saving+a+VM)
        2. Next
            * Go to the IMAGES tab
            * Click on the Image you created
            * Click on the Version you want
            * Click on Copy for either IU or TACC to grab the UUID of the image
            * Submit a ticket with that UUID to [help@jetstream-cloud.org](mailto:help@jetstream-cloud.org) to ask staff to copy your image to Jetstream2. </br>
      * Volumes:
        1. Click on the PROJECTS tab
        2. Click on the Project Folder
        3. Scroll down to VOLUMES and click on the desired volume
        4. Click on Copy to grab the UUID of the image.
        5. Submit a ticket with that VUID to [help@jetstream-cloud.org](mailto:help@jetstream-cloud.org) to ask staff to copy your volume to Jetstream2.</br>
    * **API**:
      * VMs:
        1. Follow the instructions here to [create a snapshot of your instance](https://wiki.jetstream-clould.org/Creating+snapshots+and+new+Glance+images+from+the+command+line)</br>
        2. Make note of the UUID
        3. Submit a ticket with that UUID to [help@jetstream-cloud.org](mailto:help@jetstream-cloud.org) to ask staff to copy your image to Jetstream2.</br>
      * Volumes:
        1. Use the command: `openstack volume list`
        2. Note the Volume UID
        3. Submit a ticket with that VUID to [help@jetstream-cloud.org](mailto:help@jetstream-cloud.org) to ask staff to copy your image to Jetstream2.


### Where to find help documentation <a name="GetHelp"></a>

* **JS1**:</br>Documentation for JS1 will temporarily remain during the summer of 2022 at [https://wiki.jetstream-cloud.org](https://wiki.jetstream-cloud.org) </br> **PLEASE NOTE** that this documentation will likely **NOT** be updated.

* **JS2**:</br>The latest JS2 documentation will be maintained at [docs.jetsteam-cloud.org](https://docs.jetsteam-cloud.org)

* **NEWS**: Announcements will be made at the [XSEDE User News : https://www.xsede.org/news/user-news site ](https://www.xsede.org/news/user-news)
