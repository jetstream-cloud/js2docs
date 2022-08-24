# Customizing and Saving a VM in Atmosphere

An image is a type of template for a virtual machine (VM).

You can launch an instance, custom install the software and files you want to use, then [request an image of the instance](Request+an+image+of+an+instance.md).  This will save all of the changes and updates within Atmosphere, but also make your custom changes available to yourself and collaborators.  Saving instances as images helps leverage both your time and existing resources. The saved image can be used to launch a new child instance at any time. This allows you to discard non-active instances, thus saving resources.

!!! danger "CAUTION!"

    * **THE INSTANCE MUST BE ACTIVE OR STOPPED** in order to request an image.
        * Currently, Jetstream cannot image `Suspended` or `Shelved` instances.
    * **ALL VOLUMES MUST BE DETACHED FROM THE INSTANCE**.
        * Failure to detach Volumes will result in a image whose child instances ***fail to boot***.
    * INSTANCES MUST NOT BE DELETED UNTIL **AFTER** THE IMAGING PROCESS HAS COMPLETED.
    * [Imaging Guidelines](Imaging+Guidelines.md): There are several other [restrictions and notes](Imaging+Guidelines.md) of which you must be aware in order to achieve a successful image.
        * For example, several directories and files are removed during image creation.
    * At this time, only the creator of an image may update an image.
    * **Please note that s1.* based customized instances will NOT be able to be used to create images in Atmosphere**.
    * **Additionally, new s1.* instances are no longer supported on Jetstream. Please use m1.* instances with attached volumes instead**.


After submitting the form, the Jetstream Atmosphere support staff will review and process the request. Future versions of Atmosphere will allow users to initiate the VM imaging process automatically.

Be sure to test launch any image created to validate that it behaves as expected ***BEFORE*** suspending or removing the current active instance, since only active instances can be imaged.

!!! note "BEST PRACTICE"
    It is recommended to upgrade the operating system before imaging. For CentOS based systems, it's `sudo yum update`. For Ubuntu based systems, do `sudo apt-get update` and then `sudo apt-get upgrade`.

!!! note "VERY IMPORTANT"

    Creating an image on the **SMALLEST** possible size VM on which it will run will allow the image to be launched on VMs of the same size and larger.

    For example, an image created on a Tiny size VM can be launched on a VM of any size; an image created on a Medium VM can only be launched on a Medium or larger size VM.

!!! warning "WARNING: Atmosphere vs. API"

    We cannot recommend strongly enough not using Atmosphere images on the API side of Jetstream or vice-versa.

    The Atmosphere user interface is designed to be extremely easy to use, particularly for beginning users but the trade-off is that Atmosphere enforces certain practices behind the scenes.

    The API user interface is close to raw openstack, makes almost no assumptions, requires advanced knowledge of Openstack and Linux, but is therefore much more flexible.

    API and Atmosphere base images provided by Jetstream staff require SUBSTANTIAL work to make them CLEANLY work in the other environment.
