#Jetstream2 FAQ Home

For specific FAQs, see the following pages:

* [Early Operations FAQ](js2-earlyops-faq)
* [Allocations FAQ](alloc.md)
* [Troubleshooting](trouble.md)
* [Security FAQ](security.md)
* [Software FAQ](software.md)

---
## General FAQs

### I need a root disk larger than the maximum size for Jetstream2 instances. Can you create a custom flavor for me?

We won't create custom flavors, but there are ways to get larger root disks. You can [review the flavors](../general/vmsizes.md) and see if moving up from one of the smaller VMs to a slightly larger one would yield a larger root disk. The other option is to use a custom sized root disk using what Openstack calls "boot from volume". What this means is that instead of an ephemeral boot disk for the instance, a volume is used to be the root disk.

There are several upsides to this:

* You can have a root disk large enough to fit your needs
* The disk becomes reusable as a volume if necessary
* Shelving the instance is extremely fast compared to shelving a typical instance

The downside is that using boot from volume will count against your Jetstream2-Storage allocation whereas root disks do not.

Instructions for using boot from volume are here:

* Exosphere (link coming)
* Cacao (link coming)
* Horizon (link coming)
* CLI (link coming)

---

### Will there be Microsoft Windows support on Jetstream2 ?

Microsoft Windows is not officially supported on Jetstream2. We will be making a limited number of images available for experimental use.

It is not known at this time whether GPUs will work on Microsoft-based instances. We will test this as time permits.

More information may be found on the [Microsoft Windows on Jetstream2](../general/windows.md) page.
