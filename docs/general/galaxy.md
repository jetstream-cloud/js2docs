# Galaxy

[Galaxy](https://galaxyproject.org){target=_blank} is a data analysis platform for
genomic data analysis, although support other domains is growing:
machine learning, natural language processing, climate science. **Galaxy enables
scientists to share, analyze and visualize their own data via a browser.**
Thounsands of modern and popoular tools are readily available alongside
pre-formatted reference data. There are also [extensive training
resources](https://training.galaxyproject.org/){target=_blank} for a variety of roles,
including researchers, tool developers, and educators.

![Galaxy UI](/images/galaxy.png)

## Galaxy on Jetstream

The primary way Galaxy leverages Jetstream today is totally invisible to the
user. You may already be using Jetstream without even knowing it! The Galaxy
public server available at [https://usegalaxy.org/](https://usegalaxy.org/){target=_blank} is
making opportunistic use of Jetstream resources for suitable jobs. When you
submit a job from *usegalaxy.org*, it may be automatically routed to a set of
machines running on Jetstream. The decision is based on the selected tool and
input properties, and as a user, there is currently no way to request a job
execute on Jetstream. It is worth noting that the current implementation does
not require you as a user to have a Jetstream allocation but it also does not
support custom tools or usage quotas.

## Creating your own Galaxy Instance

But what if I have an allocation and want to run my own Galaxy server or install
custom tools? Galaxy is an [open source
application](https://github.com/galaxyproject/galaxy){target=_blank} so it can be installed on
a virtual machine running on Jetstream. If you choose this path, we strongly
recommend that the installation and server management is done by a system
administrator familiar with cloud computing technology, and ideally Galaxy.
Running a Galaxy server can quickly become a time-consuming job that requires
substantial understanding of the underlying technology.

To get started with installing, visit [https://getgalaxy.org/](https://getgalaxy.org/){target=_blank}
and follow the documentation.

For any installation other than a temporary development
instance, we recommend creating a [Production
Environment](https://docs.galaxyproject.org/en/master/admin/production.html){target=_blank} for
Galaxy.
