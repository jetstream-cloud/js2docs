#Jetstream2 Resources

As noted on the [Key Differences](../overview/architecture.md#hardware) page, Jetstream2 consists of four distinct ACCESS-allocated resources. These resources are:

* [Jetstream2 (CPU only)](../overview/config.md#compute-nodes-384-nodes){target=_blank}
* [Jetstream2 Large Memory](../overview/config.md#large-memory-nodes-32-nodes){target=_blank}
* [Jetstream2 GPU](../overview/config.md#gpu-nodes-90-nodes){target=_blank}
* [Jetstream2 Storage](resources.md#jetstream2-storage)

The specifications for each are linked above.

With the exception of Jetstream2 Storage, these resources may be allocated individually. Jetstream2 Storage requires the PI apply for or already have an allocation on any one or more of the three Jetstream compute resources.

!!! note "Default Storage"
    By default, all allocations receive 1TB (1000 GB) of Jetstream2 Storage for volumes. If you will not need more than this, you do not need to request Jetstream2 Storage with your allocation request.
    
    ***Any additional storage must be justified in your allocation request.***

### Limits and important notes:

* Storage defaults to 1 TB. 
* There are no restrictions on runtime for the Jetstream2 CPU resource. As long as you have an active allocation and SUs remaining, you may run your Jetstream2 CPU VM(s) continuously or on demand.
* Jetstream2 GPU and Jetstream2 Large Memory may have runtime restriction placed at a future date. Present policy notes that Jetstream2 Staff may limit runtime on these resources to two weeks at a time. As long as resources are not in contention, we *may* opt to allow continuous running of VMs/services. Any change in resource limits will be noted via [ACCESS Infrastructure News](https://operations.access-ci.org/infrastructure_news){target=_blank} and other communications channels.

#### Jetstream2 Storage

Jetstream2 storage is an ACCESS-allocated resource. All allocations will be given a default storage amount (as noted on the [Storage](storage.md) page), and any needs beyond this initial quota require a discrete allocation on the "Indiana Jetstream2 Storage" resource. 

This storage is usable by all users on that allocation so the PI may want to institute per user quotas or discuss proper usage etiquette with the members of their allocation. Jetstream2 staff will not institute per user storage quotas, with the exception of the Jetstream2 Trial Allocation.

#### Limits on Jetstream2 Storage**

- Explore allocations are generally limited to 5TB max
- Discover allocations are generally limited to 5-10TB max
- Accelerate allocations are generally limited to 20TB max
- Maximize allocations are generally limited to 40TB max

All are subject to proper justification in the [allocations](../alloc/overview.md) process. Maxmimum values may be adjusted with proper justification and if there are adequate resources available. This is entirely at the discretion of the Jetstream2 team.

Please refer to the following pages for more information on using Jetstream2 storage under the various interfaces:

- [Using Jetstream2 Storage Under Exosphere](../ui/exo/storage.md)
- [Using Jetstream2 Storage Under Horizon](../ui/horizon/storage.md)
- [Using Jetstream2 Storage Under the CLI](../ui/cli/storage.md)
- [Using Jetstream2 Storage Under Cacao](../ui/cacao/storage.md)
- [Using Jetstream2 Storage with Manila](../general/manila.md)
- [Using Jetstream2 Storage with Object Store](../general/object.md)
