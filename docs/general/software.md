#Jetstream2 Software Collection

The Jetstream2 Software Collection is available via a shared disk that will be automatically mounted by instances created from a Jetstream2 featured image. Researchers can use modules to load any combination of software they need, similar to how HPC systems do it.

This list will be ever evolving, but at this time, these are the items planned to for the software collection:

* Matlab\*
* R\* / R Studio / Shiny
* Intel Compiler (Intel OneAPI)\*
* Singularity/Apptainer\*
* NVIDIA (formerly PGI) Compiler
* AOCC Compiler
* Anaconda\* *(Jupyter is available via Anaconda!)*
* Databases (e.g. Mysql, Postgresql, Mongo)
* Java
* Jupyter/JupyterLab/JupyterHub (as part of Anaconda)\*

Please see the following links for using the Jetstream Software Collection:

* [Using the Jetstream2 Software Collection from the command line](usingsoftware-cli.md)
* [Using the Jetstream2 Software Collection from the web desktop](usingsoftware-desktop.md)

Items like CUDA and the NVIDIA HPC SDK are not installed on the VMs or in the software collection. We recommend using the [NVIDIA containers](https://catalog.ngc.nvidia.com/containers){target=_blank} for GPU-related software from NVIDIA as the ecosystem can often be problematic for individual local installations. The [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/overview.html){target=_blank} is installed on all featured images.

This is still an ongoing effort so this list will almost certainly change in coming weeks and months.
{: .note}
