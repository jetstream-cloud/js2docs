#Virtual Machine Sizes and Configurations

Jetstream2 can be used in several different virtual machine (VM) sizes which are charged in service units (SUs) based on how much of the total system resource is used. The basic unit of VM allocation for Jetstream is based on a virtual CPU (vCPU) hour: 1 service unit (SU) is equivalent to 1 vCPU for 1 hour of wall clock time. A standard ‘Tiny’ VM instance consists of 1 vCPU, 3 GB of RAM, and 8 GB of storage. This corresponds closely to a ‘t2.small’ instance in Amazon Web Services. The majority of storage within an instance is available for user data but will vary based on the VM image selected.  The table below outlines the VM sizes created for Jetstream2.

### Jetstream2 CPU

| VM Size  | vCPUs | RAM (GB) | Local Storage (GB) | SU cost per hour |
|:-------- |:-----:|:--------:|:------------------:|:----------------:|
| m3.tiny  | 1 |  3 | 8  | 1  |
| m3.small | 2 |  6 | 20 | 2  |
| m3.quad  | 4 | 15 | 20 | 4  |
| m3.medium | 8 | 30 | 60 | 8  |
| m3.large | 16 | 60 | 60 | 16 |
| m3.xl    | 32 | 125 | 60 | 32 |
| m3.2l    | 64 | 250 | 60 | 64 |
| m3.3l    | 128 | 500 | 60 | 128  |

### Jetstream2 Large Memory

Jetstream2 Large Memory nodes charge 2 SUs per vCPU hour or 2 SUs per core per hour.

| VM Size  | vCPUs | RAM (GB) | Local Storage (GB) | SU cost per hour |
|:-------- |:-----:|:--------:|:------------------:|:----------------:|
| r3.large | 64  |  500  | 60  | 128  |
| r3.xl    | 128 |  1000 | 60  | 256  |

### Jetstream2 GPU

Jetstream2 GPU nodes charge 4 SUs per vCPU hour or 4 SUs per core per hour. Additionally, there are four NVIDIA A100 GPUs on each node. These GPUs are subdivided using NVIDIA Multi-Instance GPU (MIG) into up to 8 slices to allow more researchers and students to make use of the GPU resource.

*8 GPU slices = 1 NVIDIA 40GB Ampere A100 GPU*

| VM Size  | vCPUs | RAM(GB) | Local Storage (GB) | GPU Slices/GPU Ram | SU cost / hour |
|:-------- |:-----:|:--------:|:------------------:|:--------------------:|:----------------:|
| g3.small  | 4  |  15  | 120  | 1 slice / 5gb RAM | 16  |
| g3.medium | 8  |  30  | 120  | 2 slices / 10gb RAM | 32  |
| g3.large  | 16 |  60  | 120  | 4 slices / 20gb RAM | 64  |
| g3.xl     | 32 |  125 | 120  | 8 slices / 40gb RAM | 128 |


**This flavor information may be subject to changes in the future.**

----

THIS IS WHERE I STOPPED -- COME BACK AND FIX BEYOND THIS POINT

##### Example of SU estimation:

*   First determine the VM size appropriate to your needs:
    *   If your work requires 24 GB of RAM and 60 GB of local storage:
        *   you would request 10 SUs per hour to cover a single Large VM instance.
    *   If your work requires 10 GB of local storage in 1 thread using 3 GB of RAM:
        *   you would request 2 SUs per hour for a Small VM instance.
*   You would then multiply by the number of hours you will use that size VM in the next year and multiply by the number of VMs you will need.
*   To calculate the number of SUs you will need in the next year, first estimate the number of hours you expect to work on a particular project.
    For example, if you typically work 40 hours per week and expect to spend 25% of your time on this project that would be 10 hours per week.
*   Next, calculate the total number of hours per year for this project:
    *   Total hours = 10 hours per week \* 52 weeks per year
    *   Total hours = 520
*   Finally, calculate the total SUs for the year for a single VM instance:
    *   Total SUs = 520 hours per year \* vCPUs
        *   e.g. For a Medium VM instance: Total SUs = 520 hours per year \* 6vCPUs
        *   Total SUs = 3120
*   If your project requires more than 1 VM instance, multiply the total SUs by the number of VMs that you will need:
    *   Total SUs needed for 3 medium size VMs = 3 \* 3120
    *   Total SUs = 9360



**Shutdown your VM properly**

The calculations above assume that your VM is shutdown properly.  For instructions see [Instance management actions](Instance-management-actions_537460754.html).



For information on submitting a Research Allocation Request, please see [https://portal.xsede.org/successful-requests.](https://portal.xsede.org/successful-requests)  Note that all allocations above the startup level require a strong justification for the time being requested.



[◀️](PREV---XSEDE-Service-Units-and-Jetstream_17465435.html)BACK: [PREV - XSEDE Service Units and Jetstream](PREV---XSEDE-Service-Units-and-Jetstream_17465435.html) | **CURRENT[🔽](https://iujetstream.atlassian.net/wiki/pages/resumedraft.action?draftId=17465371)**: [Virtual Machine Sizes and Configurations](https://iujetstream.atlassian.net/wiki/pages/resumedraft.action?draftId=17465371) | MAIN[🔼](System-Overview_17465367.html): [System Overview](System-Overview_17465367.html) | _NEXT_[▶️](https://iujetstream.atlassian.net/wiki/pages/resumedraft.action?draftId=17465371): [Jetstream featured images](Jetstream-featured-images_29720632.html)

Document generated by Confluence on Aug 20, 2021 15:26

[Atlassian](http://www.atlassian.com/)
