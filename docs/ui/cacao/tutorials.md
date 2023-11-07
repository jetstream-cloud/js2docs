![cacao logo](images/cacao-logo.png){ width=128px }[Cacao Overview](overview.md) &gg; CACAO Tutorials

# Tutorial deployments with CACAO

In this section we look at tutoral deployments to help you quickly deploy your Virtual Machines, Jupyter Labs or Kubernetes clusters in just a few clicks.

If you would like to know more about the available templates and deployments in CACAO, here are some useful links:

- [Templates](templates.md): learn about the available CACAO templates and template management.
- [Deployments](deployments.md): learn about deployments with the CACAO UI.

Page contents:

- [Deploying Single/Multiple VMs](#deploying-singlemultiple-vms)
- [Deploying Multi-VM JupyterHub](#deploying-multi-vm-jupyterhub)
- [Deploying Multi-VM Kubernetes Cluster](#deploying-multi-vm-kubernetes-cluster)
- [Deploying Magic Castle](#deploying-magic-castle)
- [Deploying DADI OpenStack Instace](#deploying-dadi-openstack-instace)
- [Accessing your deployments](#accessing-your-deployments)

---

Each template is engineered to make deployment simple and accessible with a few clicks of your mouse. Although the deployment process is similar for all of the templates, here are some step-by-step tutorials on how to deploy from each template.

To begin deploying, navigate from your Home screen to the deployment page by selecting Deployments on the left hand side. An empty Deployment page looks like the following.

![deployment screen](images/deployments/1_depl.png)

Notice how there are no deployments, but the user has already added credientials for Clouds (`JETSTREAM2`) and Projects (the serial number following the Clouds button). Adding credentials is necessary in order to continue with deployments. If you have not added your credentials, read how to [here](credentials.md).

## Accessing your deployments

You can access each of your deployments by clicking on the **Deployments** button on the left hand menu. You can then select the deployment of your choice. The following screenshot example shows 3 successfully running deployments and a [shelved one](https://docs.jetstream-cloud.org/general/instancemgt/#shelve-and-unshelve) (each of them is accessbile by clicking on it for extra information).

![depl screen run](images/deployments/4_general_run.png)