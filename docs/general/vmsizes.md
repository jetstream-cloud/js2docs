#Virtual Machine Sizes and Configurations

Jetstream2 can be used in several different virtual machine (VM) sizes which are charged in service units (SUs) based on how much of the total system resource is used. The basic unit of VM allocation for Jetstream is based on a virtual CPU (vCPU) hour: 1 service unit (SU) is equivalent to 1 vCPU for 1 hour of wall clock time. A standard ‘Tiny’ VM instance consists of 1 vCPU, 3 GB of RAM, and 8 GB of storage. This corresponds closely to a ‘t2.small’ instance in Amazon Web Services. The majority of storage within an instance is available for user data but will vary based on the VM image selected.  The table below outlines the VM sizes created for Jetstream2.

*Please note that these are all separate resources. Jetstream2 CPU is the default resource. To use Large Memory or GPU resources, you must have an allocation for those resources.*

### Jetstream2 CPU

| VM Size  | vCPUs | RAM (GB) | Local Storage (GB) | SU cost per hour |
|:-------- |:-----:|:--------:|:------------------:|:----------------:|
| m3.tiny  | 1 |  3 | 20  | 1  |
| m3.small | 2 |  6 | 20 | 2  |
| m3.quad  | 4 | 15 | 20 | 4  |
| m3.medium | 8 | 30 | 60 | 8  |
| m3.large | 16 | 60 | 60 | 16 |
| m3.xl    | 32 | 125 | 60 | 32 |
| m3.2xl    | 64 | 250 | 60 | 64 |
| m3.3xl*    | 128 | 500 | 60 | 128  |

\* *m3.3xl will not be available by default. It will only be available by request and with proper justification*

### Jetstream2 Large Memory

Jetstream2 Large Memory nodes charge 2 SUs per vCPU hour or 2 SUs per core per hour.

| VM Size  | vCPUs | RAM (GB) | Local Storage (GB) | SU cost per hour |
|:-------- |:-----:|:--------:|:------------------:|:----------------:|
| r3.large | 64  |  500  | 60  | 128  |
| r3.xl    | 128 |  1000 | 60  | 256  |

### Jetstream2 GPU

Jetstream2 GPU nodes charge 4 SUs per vCPU hour or 4 SUs per core per hour. Additionally, there are four NVIDIA A100 GPUs on each node. These GPUs are subdivided using NVIDIA Multi-Instance GPU (MIG) into up to 7 slices to allow more researchers and students to make use of the GPU resource.

*7 GPU slices = 1 NVIDIA 40GB Ampere A100 GPU*

| VM Size  | vCPUs | RAM(GB) | Local Storage (GB) | GPU Slices/GPU Ram | SU cost / hour |
|:-------- |:-----:|:--------:|:------------------:|:--------------------:|:----------------:|
| g3.small  | 4  |  15  | 60   | 1 slice / 5gb RAM | 16  |
| g3.medium | 8  |  30  | 60   | 2 slices / 10gb RAM | 32  |
| g3.large  | 16 |  60  | 60   | 3 slices / 20gb RAM | 64  |
| g3.xl     | 32 |  125 | 60   | 7 slices / 40gb RAM | 128 |


**This flavor information may be subject to changes in the future.**

----

##### Example of SU estimation:

*   First determine the VM resource appropriate to your needs (CPU only, large memory, GPU):
    *   If your work requires 24 GB of RAM and 60 GB of local storage:
        *   you would request 8 SUs per hour to cover a single *m3.medium* VM instance.
    *   If your work requires 10 GB of local storage in 1 core using 3 GB of RAM:
        *   you would request 2 SUs per hour for an *m3.small* VM instance.
    *   If your work requires 1TB of RAM:
        *   you would request 256 SUs per hour for an *r3.xl* instance on Jetstream Large Memory
    *   If you work requires 20gb of GPU RAM:
        *   you would request 64 SUs per hour for a *g3.large* instance on Jetstream GPU
*   You then would calculate for the appropriate resource (refer to the tables above):
    *   For Jetstream2 CPU, you would then multiply by the number of hours you will use that size VM in the next year and multiply by the number of VMs you will need.
    *   For Jetstream2 Large Memory and GPU, either refer to the SU cost per hour in the last column, or multiply hours times 2 for LM or 4 for GPU
*   To calculate the number of SUs you will need in the next year, first estimate the number of hours you expect to work on a particular project.
    For example, if you typically work 40 hours per week and expect to spend 25% of your time on this project that would be 10 hours per week.
*   Next, calculate the total number of hours per year for this project:
    *   Total hours = 10 hours per week \* 52 weeks per year
    *   Total hours = 520
*   Finally, calculate the total SUs for the year for a single VM instance:
    *   Total SUs = 520 hours per year \* vCPUs
        *   e.g. For a Medium VM instance: Total SUs = 520 hours per year \* 8vCPUs
        *   Total SUs = 4160
*   If your project requires more than 1 VM instance, multiply the total SUs by the number of VMs that you will need:
    *   Total SUs needed for 3 medium size VMs = 3 \* 4160
    *   Total SUs = 12480

The calculations above assume that your VM is shutdown properly.  For instructions see:

* [Cacao instance management actions](../ui/atmo/deployments.md){target=_blank}
* [Exosphere instance management actions](../ui/exo/manage.md){target=_blank}
* [Horizon instance management actions](../ui/horizon/manage.md){target=_blank}
* [Command line instance management actions](../ui/cli/manage.md){target=_blank}


##### SU Estimation for Infrastructure or "Always On" allocations

For jobs that may need to run for extended periods or as "always on" infrastructure, you can take this approach:

> VM cost (SUs) x 24 hours/day x 365 days = single VM cost per year

or as an example for each resource, an m3.large, r3.large, and g3.large each running for a year:

        m3.large (16 cores) x 24 hours/day x 365 days = 140,160 SUs
        r3.large (64 cores x 2 SUs/hour) x 24 hours/day x 365 days = 1,121,280 SUs
        g3.large (16 cores x 4 SUs/hour) x 24 hours/day x 365 days = 560,640 SUs

---
Startup allocations are subject to limits. Please refer to [Jetstream2 Resources](../general/resources.md) for Startup Allocation limits.

For information on submitting a Research Allocation Request, please see [https://portal.xsede.org/successful-requests.](https://portal.xsede.org/successful-requests){target=_blank} Note that all allocations above the startup level on Jetstream2 CPU require a strong justification for the time being requested.
