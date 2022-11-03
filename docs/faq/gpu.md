# GPU Related FAQ

### There is a known issue with suspending GPU instances

We will update this [Status IO Incident](https://jetstream.status.io/pages/incident/61dc808a7e9a82053ce739d2/629a6de486604112e598b390){target=_blank} with details/

There is an issue/bug with suspending GPU instances with the version of libvirt Jetstream2 is using for virtualization.

!!! danger ""

    DO NOT SUSPEND GPU instances.

We will have to upgrade the compute nodes to resolve it. This is on the near-term timeline but we do not have a precise date at this time.

In the meantime, please only use stop or shelve with GPU instances.

### My GPU is not usable after a kernel update

The NVIDIA drivers are built as kernel modules and ***should*** rebuild on a kernel update. If they do not, you can do this on Ubuntu 20.04 instances:

    ls /var/lib/initramfs-tools | sudo xargs -n1 /usr/lib/dkms/dkms_autoinstaller start

For Ubuntu 22.04 instances, you can try:

    ls /usr/lib/modules | sudo xargs -n1 /usr/lib/dkms/dkms_autoinstaller start

This doesn't work on redhat-based instances like Rocky or Alma. We're working on a simple solution for that.

### The CUDA debugger (cuda-gdb) doesn't work on GPU instances

If you use the nvhpc module with nvcc compiler and try to use the cuda-gdb debugger, you will get an error like this:

    fatal:  One or more CUDA devices cannot be used for debugging

There is an issue with vGPU and our configuration that cannot be readily resolved. We are looking into options to work around this problem. There is no estimate for when a workaround will be in place. We apologize for any inconvenience.

### Unified memory doesn't work on GPU instances

We can confirm that unified memory is not working under the NVIDIA drivers we're using. We have reached out to NVIDIA for a timeline on when we might expect that functionality.

Regardless of the time, it is not expected that unified memory will work on fractional (slices of) GPUs, only on full GPU flavors.

We will update this FAQ entry when we have additional information.

### Is nvcc/CUDA available on the images or in the software store ?

The [NVIDIA HPC SDK](https://developer.nvidia.com/hpc-sdk){target=_blank} is available from the [Jetstream Software Store](../general/software.md).

You can do

    module avail

on featured imags to see available software packages. You should see several with names like ***nvhpc*** that will have the HPC SDK software.

For other GPU software, where possible, we highly recommend using containers from NVIDIA if they are available. The [NVIDIA Docker Container Catalog](https://catalog.ngc.nvidia.com/containers){target=_blank} is the repository.

### What CUDA version do I need for Jetstream2 GPUs ?

While NVIDIA says CUDA versions are backward compatible, we recommend using at least the same major revision
