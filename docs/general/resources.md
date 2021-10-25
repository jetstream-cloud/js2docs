#Jetstream2 Resources

As noted on the [Key Differences](../overview/keydiff.md#hardware) page, Jetstream2 consists of four distinct XSEDE-allocated resources. These resources are:

* [Jetstream2 (CPU only)](../overview/config.md#compute-nodes-384-nodes){target=_blank}
* [Jetstream2 Large Memory](../overview/config.md#large-memory-nodes-32-nodes){target=_blank}
* [Jetstream2 GPU](../overview/config.md#gpu-nodes-90-nodes){target=_blank}
* [Jetstream2 Storage](storage.md){target=_blank}

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
