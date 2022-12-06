# Budgeting for Common Usage Scenarios

!!! note
    If you already have a clear picture of what resources your project requires, you can now estimate your SU needs using the usage estimation calculator here: [Usage Estimation Calculator](../alloc/estimator.md){target=_blank}


Because Jetstream2 is available solely through [SUs converted from ACCESS credits](../general/access.md){target=_blank}, it is often helpful to have a plan for what compute resources your project intends to use and to budget SU expenditure before submitting an exchange request. The goal of this document is to provide examples of common usage scenarios for Jetstream2 and how one might budget for them. 

## General Considerations

Although needs will vary largely depending on the type of project at hand, there are still some best practices and general considerations to keep in mind:

- If you are entirely unsure about what kind of system resources your application needs, it may be a good starting point to monitor its usage on a local machine/workstation (if possible), for example using `top [-p PID]`.
- Please consider padding your budget to add room for any extra time spent in development, experimentation, workflow setup, etc.

---

## Virtual Workstations and Traditional "Burst" Workloads

Because Jetstream2 instances give the user total control, including `sudo` access, a common use case is setting up an instance as a "virtual workstation" of sorts, allowing a researcher to offload computation from their local workstation or laptop, often to one that is also more powerful. 

Although direct comparisons are fraught with peril due to differences in architectures, optimization technologies, cooling solutions, and more, the following can serve as a decent general frame of reference for different flavors' performance:

- m3.quad: roughly a typical mid-range laptop equipped with 4-6 CPU cores and 8-16 GB of RAM.
- m3.medium: a higher-end laptop or research workstation might have upwards of 8 CPU cores and 32 GB of RAM

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

# TODO: What to write here? "IDK, it depends"?