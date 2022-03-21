#Jetstream2 System Overview

**Jetstream2** is a transformative update to the NSF’s science and engineering cloud infrastructure, will provide 8 petaFLOPS of virtual supercomputing power to simplify data analysis, boost discovery, and increase availability of AI resources. It is an NSF-funded, user-friendly _cloud environment_ designed to allow "always on" research infrastructure and to give researchers access to interactive computing and data analysis resources on demand, whenever and wherever they want to analyze their data. While it shares many common features and abilities with other research computing resources, it is **not** a traditional High Performance Computing (HPC) or High Throughput Computing (HTC) environment.

It provides a library of **_virtual machines_** and shared software designed to create research infrastructure or to perform discipline-specific scientific analysis. Software creators and researchers will be able to create their own customized virtual machines (VM) or their own private computing system within Jetstream2.

Jetstream features multiple user interfaces, including the following _**web-based user interfaces**_:

- [Exosphere](../ui/exo/exo.md)
- [Horizon](../ui/horizon/intro.md)
- [Cacao](../ui/cacao/intro.md)

as well as [the OpenStack Command Line Interface (CLI)](../ui/cli/overview.md) and the [OpenStack Software Development Kit (SDK)](https://docs.openstack.org/openstacksdk/latest/){target=_blank})

The operational software environment is based on [OpenStack](https://www.openstack.org/){target=_blank}.

### Accessing Jetstream ###

Jetstream2 is primarily accessible through either the [Exosphere](../ui/exo/exo.md) or [Cacao](../ui/cacao/intro.md) web interfaces using [XSEDE](https://www.xsede.org/){target=_blank} credentials via [Globus Auth](https://www.globus.org/tags/globus-auth){target=_blank}.

> Jetstream2 is **not** accessible via [XSEDE's Single Sign-On Login Hub.](https://portal.xsede.org/single-sign-on-hub){target=_blank}


>Newly created XSEDE accounts must be added to a Jetstream2 specific allocation by the PI or Resource manager in order to access Jetstream2.

>Jetstream2 is meant primarily for **interactive** research, small scale processing **on demand**, or as the backend to science **gateways** to send research jobs to other HPC or HTC resources, or for general infrastructure for research or research-related development.

Jetstream2 may be used for **prototyping**, for creating tailored **workflows** to either use at smaller scale with a handful of CPUs or to port to larger environments after doing your **proof of concept** work at a smaller level.

### About Jetstream2 ###

Consisting of five computational systems, Jetstream2’s primary system will be located at Indiana University, with four smaller regional systems deployed nationwide at partners Arizona State University, Cornell University, the University of Hawai’i, and the Texas Advanced Computing Center. The 8 petaFLOPS cloud computing system will use next-generation AMD EPYC processors and NVIDIA A100 GPUs, and 17.2 petabytes of storage.

Within the Pervasive Technology Institute the project will be led by UITS Research Technologies with key contributions from the Cyberinfrastructure Integration Research Center and the Center for Applied Cybersecurity Research. Additional Jetstream2 partners include the University of Arizona, Johns Hopkins University, and the University Corporation for Atmospheric Research, with Dell Inc. as the primary supplier.

For more information, please see:

* [NSF Award 2005506 - Jetstream 2: Accelerating Science and Engineering On-Demand](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2005506){target=_blank}
* [Jetstream System Specifications](config.md)
