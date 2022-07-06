# Overview

### Snapshots and Images

When you have created a custom workflow or configuration, you can create a _snapshot_ for your own use. In **OpenStack**, an instance _snapshot_ is an [image](/general/instancemgt/#Image). The only difference between an _image_ that has been uploaded directly to the image data service: [glance](https://docs.openstack.org/glance) and an _image_ you create by _snapshot_ is that an image created by snapshot has additional properties in the glance database and defaults to being private.

!!! note ""

    [Glance](https://docs.openstack.org/glance) is a central image repository which provides discovering, registering, retrieving for disk and server images.

!!! warning "CAUTION:: SHUTOFF"

    You can create a snapshot from a running server instance, but if you want to preserve data, ***you must shut down the source VM and verify the instance status is SHUTOFF before creating the snapshot***.

!!! warning "CAUTION:: cloud-init & qemu-guest-agent"

    Before creating the snapshot and/or image, you'll want to make sure that `cloud-init` is installed on your instance as well as `qemu-guest-agent`

    * If your instance was based on one of the [Featured](/general/featured) images, both _cloud-init_ and _qemu-guest-agent_ should be present unless you explicitly removed them.

#### To create the snapshot from the command line <a name="ImageCreate"></a>

`openstack server image create --name snapshot-image-name instance-name`

    (e.g. openstack server image create --name MyCustomImage-Feb-7-2022 my-cutom-instance)

Snapshots won't initially show in Horizon or other interfaces. To make a snapshot visible, you'll need to export it and bring it back as a Glance image. If you only plan to use this within your project and from the command line only, the rest of the steps aren't necessary.

`openstack image save --file whatever_file_name_you_like.raw UID`

    (e.g. openstack image save --file my-custom-image.raw 569677d8-c7b0-4606-86d8-7673a5ecd5cf )

#### Uploading a snapshot or new image into Glance:

You can upload a snapshot or image into Glance using:

    openstack image create --disk-format raw --container-format bare --property visibility=private --property hw_disk_bus=scsi --property hw_scsi_model=virtio-scsi --property hw_qemu_guest_agent=yes --property os_require_quiesce=yes --file my-custom-image.raw My-Custom-Image-Name

!!! warning "CAUTION:: metadata tags and visibility"

    There are a lot of metadata tags in the example, but those are important to insure that your instances will create properly from the stored image. You definitely want to make sure you get them all.

    You can also set the ***visibility*** property during creation, but see [Sharing an Image](#ImageSharing) for limits.

#### Boot & Test

- Boot the new image.
- Test it.
- Make sure it works.
- Do this before deleting. **Please**. ***Once it's gone, it's really gone***. Be sure.

---

#### Delete unused snapshot <a name="ImageDelete"></a>

Delete your snapshot if you no longer need it. For example:

`openstack image delete 569677d8-c7b0-4606-86d8-7673a5ecd5cf`

---

#### Sharing an Image <a name="ImageSharing"></a>

When you upload an image to Openstack, you set the ***visibility*** of your image. Our documentation for uploading an image from the CLI sets visibility to `community`. However, if you’ve set it to `shared` or `private`, you will need to change that if you want to share it.

If ***visibility*** is set to `shared` or `private`, visibility will be limited to the project/allocation where you uploaded (e.g. only members of your TG-xxxxxxx project will see it initially). If you need to share it with another allocation but don’t want to make it visible to all projects, you’ll want to verify that the visibility is shared by doing:


    openstack image show <UUID or NAME> -c name -c id -c visibility

To change the visibility for an image your allocation/project owns, do:

    openstack image set --shared <UUID or NAME>

Then to share it with a project you do:

    openstack image add project <image UUID or NAME> <project>

Where project is the TG-xxxxxxxxx number of the allocation you want to share it with.

Someone from the other project you're sharing it with would then need to do

    openstack image set --accept <image UUID or NAME>

to accept the image.

!!! warning "CAUTION:: VISIBILITY"

    You can set the ***visibility*** property to `community` (all can see and boot), `shared` (only those you specify can see and boot), `private` (only your allocation can see and boot). Only in VERY special cases will Jetstream2 allow `public` visibility, such as staff-featured images. Limiting the number of fully `public` images in the catalog improves Jetstream2 reliability and performance.

    For more information on Glance ***visibility*** properties, see [https://wiki.openstack.org/wiki/Glance-v2-community-image-visibility-design](https://wiki.openstack.org/wiki/Glance-v2-community-image-visibility-design)

    Currently, ***visibility*** can only be modified in the [Horizon](/ui/horizon/intro) and [CLI](/ui/cli/snapshot-image) interfaces.
