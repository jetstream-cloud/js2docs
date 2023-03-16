![cacao logo](images/cacao-logo.png){ width=128px }[Cacao Overview](overview.md) &gg; Templates

# Templates

A template refers to a set of instructions or a description of what cloud resources to create in a cloud. A template in CACAO requires a template engine to process these instructions. Currently, CACAO only supports Hashicorp Terraform templates, including any embedded scripts or code that is supported through Terraform's [local-exec provisioner](https://developer.hashicorp.com/terraform/language/resources/provisioners/local-exec), such as Ansible.

**_Note_:** &#9432; At this time, new templates can only be added through the CACAO API; the UI will support importing new templates soon.

## Template catalog

The templates interface provides a catalog view of existing templates that are public, shared to you by other users, or ones that you imported.

There currently are 5 templates you can choose from:

| Template name | Description/Use case |
|---|---|
| Simple launch of single/multiple VM(s) (*openstack-single-image*) | Deployment of one or more VMs |
| Multi-VM JupyterHub (*jupytethub*) | Deployment of a JupyterHub with a "control" instance (for the instructor/s) and a number of  Jupyter Notebooks learners can use (useful for workshops)|
| Multi-VM Kubernetes cluster (*single-image-k3s*) | Allows the deployment of containerized applications in a Kubernetes cluster environment |
| DADI OpenStack instance (*DADI*) | Deploys a DADI  cluster for a secure, scalable cloud space |
| Launch VMs for a workshop (*vm4workshop*) | Launches VMs at workshop capacity with the possibility to have shared storage. Useful for long running workshops that require sharing data between learners. |

## Deploying from Templates

Each template is engineered to make deployment simple and accessible with a few clicks of your mouse. Although the deployment process is similar for all of the templates, here are some step-by-step tutorials on how to deploy from each template.

To begin deploying, navigate from your Home screen to the deployment page by selecting Deployments on the left hand side. An empty Deployment page looks like the following.

![deployment screen](images/deployments/1_depl.png)

Notice how there are no deployments, but the user has already added credientials for Clouds (`JETSTREAM2`) and Projects (the serial number following the Clouds button). Adding credentials is necessary in order to continue with deployments. If you have not added your credentials, read how to [here](credentials.md).

### Deploying Single/Multiple VMs

From the deployment screen, select **simple launch of one or more vms**
![single 0](images/deployments/2_depl/2_1_sngl.png)

This will open a small window, which will ask you which region you'd like to deploy onto (more regions are to be deployed in the future, for now 'IU' is the only option). Clicking **Next** will open the Parameters window. Give the deployment a descriptive name, and select the image you'd like to deply from. In this example, we choose the base **Featured-Ubuntu22** image. You can also select the amount of instances you want to create (in the example, we only create one), and the [size](https://docs.jetstream-cloud.org/general/vmsizes/) of deployment.
![single 1](images/deployments/3_1_sngl/3_1_1_name.png)

Clicking next, will open the summary window prior to launch. To deploy, click **Submit**.
![single 2](images/deployments/3_1_sngl/3_1_2_summary.png)

The VM should be successfully launched after a few minutes of building. You can access the VM by either:

1. clicking on the small Console button;
2. clicking on the PC button;
3. Through `ssh` (assuming you already have added your credentials)

![single 3](images/deployments/3_1_sngl/3_1_3_running.png)

### Deploying Multi-VM JupyterHub

**_Coming Soon_**

### Deploying Multi-VM Kubernetes Cluster

**_Under review_**

From the deployment screen, select **launch a multi-vm kubernetes cluster (k3s)**
![k3 0](images/deployments/2_depl/2_3_k3.png)

Select the region, add add a deployment name. Select the image you want to use with your deployment, alongside number of instances and size. Select wether to disable [Traefik Ingress](https://doc.traefik.io/traefik/providers/kubernetes-ingress/) for your work.
![k3 2](images/deployments/3_3_k3/3_3_2_params.png)

Review the summary and launch.
![k3 3](images/deployments/3_3_k3/3_3_3_summary.png)

### Deploying DADI OpenStack Instace

**_Under review_**

From the deployment screen, select **launch a DADI OpenStack instance**
![dadi 0](images/deployments/2_depl/2_4_dadi.png)

Select the region, and add a deployment name. You can also choose to run `dadi-cli` or `workqueue_factory`.
![dadi 2](images/deployments/3_4_dadi/3_4_2_params.png)

Review the summary and launch.
![dadi 3](images/deployments/3_4_dadi/3_4_3_summary.png)

### Deploying Multiple VMs for workshops

From the deployment screen, select **launch instances for a workshop**
![vm4w 0](images/deployments/2_depl/2_5_vm4w.png)

After selecting your region, the next step is to set parameters: give a descriptive name, select the deployment image and size, number of learners and instructors, and spare VMs (optional).
![vm4w 2](images/deployments/3_5_vm4w/3_5_2_depl_param.png)

The next step is to set the usernames. This can be done manually through the left hand writable field (add with commas and spaces) or by uploading a CSV file. Clicking **ADD** (or **UPLOAD** if using a CSV) will show the added usernames on the right hand field. The "Added Usernames" field can be used to remove unwanted usernames.
![vm4w 3](images/deployments/3_5_vm4w/3_5_3_names.png)
![vm4w 3_1](images/deployments/3_5_vm4w/3_5_3_1_names_added.png)

After adding usernames, instructors are able to add their SSH key. You can only use ssh keys that have already been added to the Credentials -- read how to [here](https://docs.jetstream-cloud.org/ui/cacao/credentials/#adding-an-ssh-public-key), or how to create an ssh key [here](https://www.ssh.com/academy/ssh/keygen).
![vm4w 4](images/deployments/3_5_vm4w/3_5_4_ssh.png)

You can set a shared storage space as well. This shared storage will be visible and accessible through all the VMs that have been deployed through this method. Lastly, review your deployment and click submit to launch.
![vm4w 5](images/deployments/3_5_vm4w/3_5_5_summary.png)

The launched screen looks like the following screenshot:
![vm4w 6](images/deployments/3_5_vm4w/3_5_6_launched.png)

Upon launch, the instructor will receive a list of passwords and IP addresses that the users can use in order to connect via `ssh` from their own computers.

### Accessing your deployments

You can access each of your deployments by clicking on the **Deployments** button on the left hand menu. You can then select the deployment of your choice. The following screenshot example shows 3 successfully running deployments and a [shelved one](https://docs.jetstream-cloud.org/general/instancemgt/#shelve-and-unshelve) (each of them is accessbile by clicking on it for extra information).

![depl screen run](images/deployments/4_general_run.png)

## Managing a template (that you own)

**_Coming Soon_**

## Deleting a template

**_Coming Soon_**