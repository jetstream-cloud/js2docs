# Key Differences Between Jetstream1 and Jetstream2

Jetstream1 utilized two primary clouds, geographically dispersed and powered by [OpenStack](https://www.openstack.org/){target=_blank}, to provide thousands of concurrent virtual machines to researchers, educators, and students from hundreds of institutions across the United States. Jetstream1 featured Atmosphere, a user-friendly graphical user environment, as the means of access for the majority of users. Jetstream1 also allowed API access for infrastructure-driven projects like science gateways.

There will be quite a few similarities between Jetstream1 and Jetstream2. Jetstream2 will be powered by a more recent version of OpenStack and will still have a primary mission of providing virtual machine services to research and education faculty, staff, and students. Jetstream2, however, will build on what Jetstream1 delivered and provide a number of improvements and new services. This page will try to identify the major differences.

The biggest difference is that Jetstream2 will consist of one primary cloud and multiple regional clouds. As you can see by the image below, the primary cloud will be hosted at Indiana University in Bloomington, IN with regional clouds at various institutions across the United States.

*Another huge distinction is that instead of different domains -- default (Atmosphere) and tacc (API) domains, there is one namespace for Jetstream2. You can change between the CLI, Horizon, Exosphere, and Cacao as you see fit to manage your resources*
{: .note}

![Jetstream2 Architecture](../../images/JS2-Architecture.jpg)

Allocations will only be awarded on the primary cloud by default.

### Hardware

Jetstream2 will also bring [multiple classes of research computing hardware](config.md){target=_blank}. Jetstream2 will still have hundreds of CPU-based compute nodes for general purpose virtual machines/computing. Jetstream2 will also feature a small number of large memory nodes with up to 1 terabyte of RAM. Jetstream2 will also make available 90 nodes of GPU-enabled nodes with four [NVIDIA A100 GPUs](https://www.nvidia.com/en-us/data-center/a100/){target=_blank}. These will be subdivided using [NVIDIA virtual GPU (vGPU)](https://www.nvidia.com/en-us/data-center/virtual-solutions/){target=_blank} to allow Jetstream2 allocations to utilize from 1/8th of a GPU to an entire GPU in their instances to allow everything from educational use requiring a minimal amount of GPU processing power to a full GPU for research workloads.

### Interfaces

Jetstream2 will also have multiple user interfaces. Atmosphere has evolved into a new tool called [Containerized Atmosphere for Continuous Analysis Orchestration (CACAO or simply Cacao)](../ui/cacao/intro.md){target=_blank}, which is built on the principles of Atmosphere (abstracting complicated functions such as firewalls and virtual networking). Jetstream2 will also provide API services utilizing both the OpenStack Horizon GUI and a robust command line interface (CLI). Because Jetstream2 will no longer have separate operating domains for Cacao and API operations, those utilizing Jetstream2 can switch between interfaces easily, seeing all virtual machines and other assets created in any interface. This single namespace also allows for third-party interfaces that can manage any OpenStack created resource to be used with Jetstream2. At the time of deployment, Jetstream2 will feature one such third-party interface called [Exosphere](../ui/exo/exo.md){target=_blank}.

### Containers and Orchestration

Jetstream2 will bring support for containers to the forefront of services. It will also support managing and scaling container-based workloads via the cloud-native functionality of OpenStack Magnum as has been demonstrated with Jetstream1. Users will be able to deploy Docker Swarm, Apache Mesos, or Kubernetes container orchestration engines to manage and run their container-based research workloads. In addition, the features of Cacao will provide similar functionality to individuals who have no desire to access the OpenStack API directly. Both approaches will allow researchers and educators to scale their workloads dynamically according to their needs.

### Additional Services

Services such as OpenStack Heat will be available for researchers and developers, as well. OpenStack Heat is a service that allows individuals to instantiate complex resources with dependencies via a declarative YAML-based language. Similar to Magnum, other OpenStack services such as Trove and Sahara also leverage Heat to provide relational and non-relational databases and to provision data-intensive application clusters. Further, tools such as HashiCorp's [Terraform](https://www.terraform.io/){target=_blank} programmable infrastructure, with the ability to deploy on Jetstream2, private clouds, and commercial clouds easily and consistently, will allow developers and researchers to have their environements where they need and when they need it. These capabilities build on one of the fundamental aspects of cloud computing that was demonstrated in abundance with Jetstream1: the ability of users to create, manage, and orchestrate use of tools autonomously, based on need, without involving sysadmins to install or enable new software.

### Virtual Clusters

In addition to the ability for individuals to control their infrastructure programmatically, Jetstream2 will provide the capability to spin up [elastic HPC virtual clusters (VCs)](https://xcri-docs.readthedocs.io/en/latest/toolkits/vc-installation/){target=_blank} at the push of a button. These have been tested extensively on Jetstream1, with about thirty VCs running in production at different times. These Slurm-powered virtual clusters allow individuals to transition easily between cloud and HPC resources, acting as both a test-bed environment for custom software, and a highly-available production resource for projects with modest computational needs. The deployment process for these resources in Jetstream2 will be streamlined, allowing individuals to deploy an instance, acting as a head node, that is ready to accept jobs. Once jobs are submitted, worker instances will be automatically created and destroyed as needed. The Singularity/Apptainer container runtime environment will be built into these VCs, allowing individuals to use containerized scientific software without lengthy installation processes.
