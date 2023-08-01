# Budgeting for Common Usage Scenarios

!!! note
    If you already have a clear picture of what resources your project requires, you can now estimate your SU needs using the usage estimation calculator here: [Usage Estimation Calculator](../alloc/estimator.md){target=_blank}


Because Jetstream2 is available solely through [SUs converted from ACCESS credits](../general/access.md){target=_blank}, it is often helpful to have a plan for what compute resources your project intends to use and to budget SU expenditure before submitting an exchange request. The goal of this document is to provide examples of common usage scenarios for Jetstream2 and how one might budget for them. 

## General Considerations

Although needs will vary largely depending on the type of project at hand, there are still some best practices and general considerations to keep in mind:

- Please consider padding your budget to add room for any extra time spent in development and other incidentals. We usually recommend budgeting at least 10% of your time to development.
- If you are entirely unsure about what kind of system resources your application needs, it may be wise to start with an [Explore allocation](general-allocations.md){target=_blank} and run your own performance and scaling measurements to determine what sort of VM structure you'll need.
- Try to budget high, but start low. Users often overestimate how much compute power their application really needs, **especially when it comes to GPUs**. Since [resizing an instance](../../general/instancemgt/#resize){target=_blank} to a larger flavor is always easy, we recommend starting small then scaling vertically as necessary.

### Storage

As noted in the [Jetstream2 Resources article](../general/resources.md){target=_blank}, if you do not explicitly request storage, the default cap for allocations of 1 TB (1,000 GB) is included. If your project requires it, additional Jetstream2 storage is an ACCESS-marketplace-allocated resource and can be requested with an [exchange request](https://allocations.access-ci.org/use-credits-overview){target=_blank} at a rate of `1 ACCESS credit == 1 SU == 1 GB`. Please note that all storage requests will require appropriate justification.

Also note that the default 1 TB quota is only a floor, and storage allocations are absolute. In other words, the default 1 TB is **replaced** by a discrete allocation, **not added** on top of it. For example, if a project has a Jetstream2 Storage allocation through ACCESS of 3,000 credits/SUs/GB, their total storage quota will be 3 TB (not `3 TB + 1 TB = 4 TB`). In this sense, preparing storage exchange requests is simple--just request the amount of total GB needed.

---

!!! note
    The recommendations that follow are intended to give a best guess on how to forecast, but nothing is perfect. **Under-budgeting and running out of SUs is not the end of the world!** In most cases, it is relatively uncomplicated to obtain additional credits and/or move up to the next ACCESS tier (at least until you reach the [Maximize ACCESS](research.md){target=_blank} threshold). If you would like to consult about your specific use case and allocation types or budgeting, please reach out to [help@jetstream-cloud.org](mailto:help@jetstream-cloud.org).

---

## Virtual Workstations and Traditional "Burst" Workloads

Because Jetstream2 instances give the user total control, including `sudo` access, a common use case is setting up an instance as a "virtual workstation" of sorts, allowing a researcher to offload computation from their local workstation or laptop, often to one that is also more powerful. 

Although direct comparisons are fraught with peril due to differences in architectures, optimization technologies, cooling solutions, and more, the following might serve as a decent frame of reference for different flavors' performance:

- **m3.quad:** roughly a typical mid-range laptop equipped with 4-6 CPU cores and 8-16 GB of RAM.
- **m3.medium:** a higher-end laptop or research workstation might have upwards of 8 CPU cores and 32 GB of RAM

Since they are not providing services or infrastructure that needs to be accessible 24/7, these kinds of instances can be [shelved](../../general/instancemgt/#shelve-and-unshelve){target=_blank} when you are not actively working on them to conserve SUs. This makes budgeting a bit trickier.

For example, if you intend to work on your instance for a quarter of an 8-hour work day, but not on the weekends, then you might plug the following into the [Usage Estimation Calculator](../alloc/estimator.md){target=_blank} to budget for the year: 2 hours/day, 5 days/week, and 52 total weeks.

---

## "Always-On" Infrastructure

Because of its lack of restrictions on runtime for CPU resources and the ability to route external traffic to instances (for example with a public IP address), an extremely common use case for Jetstream2 is hosting persistent or "always-on" infrastructure for projects.

Given a selected [instance flavor (VM size)](../general/vmsizes.md){target=_blank}, these types of workloads are simple to budget for, given that they run constantly. For example, one could simply use the default 24 hours/day, 7 days/week, and 52 total weeks on the [Usage Estimation Calculator](../alloc/estimator.md){target=_blank} to find approximate usage for a year.

### Static Web Servers

**Examples**:

- A simple site showcasing information and images about a research group and their project
- A gateway sharing research data, manuscripts, or media
- An endpoint serving static files/data to another service or application

These kinds of web servers are usually not too resource intensive, but the amount of compute required might depend on several factors, including:

1. The type of static content being served (small web pages vs. bulky data files)
2. The size/amount of content being served
3. The density of expected traffic to the server (1 visitor/hr vs. 1000 visitors/hr)

Servers for static pages, small amounts of data, and light to moderate traffic don't generally require more resources than those offered by an m3.quad instance (or even m3.small to m3.tiny on the lighter side). If you plan to serve large amounts of data or media, or you expect a high amount of traffic, you may see benefits by upsizing.

### Dynamic Web Apps and Other

**Examples**:

- A website with a large amount of interactivity or dynamic elements
- An RStudio Server or JupyterHub host
- A REST API that performs significant server-side processing for requests
- An endpoint that dynamically processes and streams large amounts of data to/from an application

This type of application is difficult to make uneducated recommendations for due to the widely variable nature of usage from person to person. Because of this, it is especially important for you to be familiar with the performance requirements of your application, or, as mentioned above, to be willing to explore a bit. 