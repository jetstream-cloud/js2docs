![cacao logo](images/cacao-logo.png){ width=128px }[Cacao Overview](overview.md) &gg; Templates

# Templates

A template refers to a set of instructions or a description of what cloud resources to create in a cloud. A template in CACAO requires a template engine to process these instructions. Currently, CACAO only supports Hashicorp Terraform templates, including any embedded scripts or code that is supported through Terraform's [local-exec provisioner](https://developer.hashicorp.com/terraform/language/resources/provisioners/local-exec), such as Ansible.

**_Note_:** &#9432; At this time, new templates can only be added through the CACAO API; the UI will support importing new templates soon.

## Template catalog

The templates interface provides a catalog view of existing templates that are public, shared to you by other users, or ones that you imported.

There currently are 5 templates you can choose from:

| Template name | Description/Use case | Deployment Tutorial |
|---|---|---|
| Simple launch of single/multiple VM(s) (*openstack-single-image*) | Deployment of one or more VMs | [tutorial link](tutorials.md/#deploying-singlemultiple-vms) | 
| Multi-VM JupyterHub (*jupytethub*) | Deployment of a JupyterHub with a "control" instance (for the instructor/s) and a number of  Jupyter Notebooks learners can use (useful for workshops)| [tutorial link](tutorials.md/#deploying-multi-vm-jupyterhub) |
| Multi-VM Kubernetes cluster (*single-image-k3s*) | Allows the deployment of containerized applications in a Kubernetes cluster environment | [tutorial link](tutorials.md/#deploying-multi-vm-kubernetes-cluster)|
| DADI OpenStack instance (*DADI*) | Deploys a DADI  cluster for a secure, scalable cloud space | [tutorial link](tutorials.md/#deploying-dadi-openstack-instace) |
| Launch VMs for a workshop (*vm4workshop*) | Launches VMs at workshop capacity with the possibility to have shared storage. Useful for long running workshops that require sharing data between learners. | [tutorial link](tutorials.md/#deploying-multiple-vms-for-workshops) |

## Managing a template (that you own)

**_Coming Soon_**

## Deleting a template

**_Coming Soon_**