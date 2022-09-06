#Jetstream2 Resources

As noted on the [Key Differences](../overview/architecture.md#hardware) page, Jetstream2 consists of four distinct XSEDE-allocated resources. These resources are:

* [Jetstream2 (CPU only)](../overview/config.md#compute-nodes-384-nodes){target=_blank}
* [Jetstream2 Large Memory](../overview/config.md#large-memory-nodes-32-nodes){target=_blank}
* [Jetstream2 GPU](../overview/config.md#gpu-nodes-90-nodes){target=_blank}
* [Jetstream2 Storage](resources.md#jetstream2-storage)

The specifications for each are linked above.

With the exception of Jetstream2 Storage, these resources may be allocated individually. Jetstream2 Storage requires the PI apply for or already have an allocation on one of the three Jetstream compute resources.

### Maximum Startup/Campus Champion Allocation values for each resource are:

* Jetstream2 CPU - 200,000 SUs
* Jetstream2 Large Memory - 400,000 SUs
* Jetstream2 GPU - 600,000 SUs
* Jetstream2 Storage - 1TB default\*

> \* *Storage limits may be larger than 1TB per allocation for a startup if well-justified.*

### Limits and important notes:

* There are no request limits for Education or Research allocations. However, all requests must show the appropriate justification. Please refer to [Jetstream2 Education Allocations](../alloc/education.md) or the [XSEDE Research Allocation page](https://portal.xsede.org/allocations/research){target=_blank} for additional information on how to create an appropriate Education or Research allocation request.
* There are no restrictions on runtime for the Jetstream2 CPU resource. As long as you have an active allocation and SUs remaining, you may run your Jetstream2 CPU VM(s) continuously or on demand.
* Jetstream2 GPU and Jetstream2 Large Memory may have runtime restriction placed at a future date. Present policy notes that Jetstream2 Staff may limit runtime on these resources to two weeks at a time. As long as resources are not in contention, we *may* opt to allow continuous running of VMs/services. Any change in resource limits will be noted via [XSEDE User News](https://portal.xsede.org/user-news){target=_blank}

#### Jetstream2 Storage

Jetstream2 storage is an allocated resource. All allocations will be given a default storage amount (as noted on the [Jetstream2 Resources](../general/resources.md) page).

This storage is usable by all users on that allocation so the PI may want to institute per user quotas or discuss proper usage etiquette with the members of their allocation. Jetstream2 staff will not institute per user storage quotas, with the exception of the Jetstream2 Trial Allocation.

**Limits on Jetstream2 Storage**

- Startup allocations are generally limited to 5-10TB max
- Education allocations are generally limited to 10TB max
- Research allocations are genereally limited to 40TB max

All are subject to proper justification in the [allocations](../alloc/overview.md) process. Maxmimum values may be adjusted with proper justification and if there are adequate resources available. This is entirely at the discretion of the Jetstream2 team.

Please refer to the following pages for more information on using Jetstream2 storage under the various interfaces:

- [Using Jetstream2 Storage Under Cacao](../ui/cacao/storage.md)
- [Using Jetstream2 Storage Under Exosphere](../ui/exo/storage.md)
- [Using Jetstream2 Storage Under Horizon](../ui/horizon/storage.md)
- [Using Jetstream2 Storage Under the CLI](../ui/cli/storage.md)
- [Using Jetstream2 Storage with Manila](../general/manila.md)
- [Using Jetstream2 Storage with Object Store](../general/object.md)
