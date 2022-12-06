# Featured Images

Jetstream2 will have a limited set of featured images. These are images that the Jestream2 team curates and maintains.

A key difference between Jetstream1 and Jetstream2 is that there will not be application specific featured images. We will maintain a [software collection](software.md) that will be made available on every virtual machine at boot. Software will be loaded via [Lmod Modules](https://lmod.readthedocs.io/en/latest/){target=_blank}.

At this time, the featured images will be:

* Ubuntu 22.04
* Ubuntu 20.04
* Rocky 8 / Alma 8
* CentOS 7 *(will retire soon -- will NOT support GPU operations)*

All featured images are named ***Featured-yyyyyyyy*** (e.g. Featured-Ubuntu22) on Jetstream2.

These featured images will evolve over time. As distributions leave support (e.g Ubuntu 18 will end support in April 2023), we will replace them with newer, supported versions. NVIDIA drivers will be present on all featured images so any of the featured images will work with Jetstream2 GPUs.

!!! Note "ACCESS to Jetstream2 SUs"

     Due to issues with the NVIDIA GRID driver, we have discontinued support for GPUs using CentOS 7. We will be removing CentOS 7 from the featured images once we have a stable Rocky 9 build available.

Our goal is to maintain a minimum of featured images but keep them updated via automated pipeline on a weekly basis.
