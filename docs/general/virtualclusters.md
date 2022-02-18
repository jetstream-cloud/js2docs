# Virtual Clusters on Jetstream2

A Virtual Cluster is a computer cluster that is made up of a single head node which runs the Slurm system, as well as a number of compute nodes. The head node is responsible for controlling the compute nodes. A large filesystem can be shared between all of the nodes. The head node is accessible to users via a public IP address and the compute nodes are created on-demand as jobs are submitted to the queue.

Slurm is a resource management system that helps organize and manage computer resources. It allocates resources to different tasks or jobs, making sure that everything runs as smoothly as possible.
{: .note}

## Options to create your own virtual cluster on Jetstream2

- [Exosphere's push-button cluster feature](../ui/exo/push-button-cluster.md) (easy, less configurable)
- On the command-line, running shell scripts (trickier, more flexible). See the [XCRI Toolkit Docs](https://xcri-docs.readthedocs.io/en/latest/toolkits/vc-installation/){target=_blank} for more information.


## References

- [Virtual Clusters in the Jetstream Cloud: A story of elasticized HPC](https://dl.acm.org/doi/abs/10.1145/3355738.3355752){target=_blank}
- [Presentation on Virtual Clusters](https://scholarworks.iu.edu/dspace/bitstream/handle/2022/24448/HARC19_Eric_Coulter.pdf){target=_blank}
