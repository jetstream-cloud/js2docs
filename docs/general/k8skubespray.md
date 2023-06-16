# Deploy Kubernetes on Jetstream 2 with Kubespray

This tutorial will explain how to install Kubernetes on Jetstream 2 relying on Kubespray. The other strategy for deploying Kubernetes is Openstack Magnum, which being integrated in Openstack is generally easier, however, it is not operational on Jetstream 2 yet.

Kubespray is a project built on top of Terraform, for creating Openstack resources, and Ansible, for configuring the Virtual Machines for Kubernetes.

Kubespray v2.21.0 was published in January 2023, which installs Kubernetes v1.25.6, released in December 2022.

## Create Jetstream Virtual machines with Terraform

Terraform allows to execute recipes that describe a set of OpenStack resources and their relationship. In the context of this tutorial, we do not need to learn much about Terraform, we will configure and execute the recipe provided by `kubespray`.

### Requirements

We have been testing with `python-openstackclient` version 6.1.0, but any recent openstack client should work.
install `terraform` by copying the correct binary to `/usr/local/bin/`, see <https://www.terraform.io/intro/getting-started/install.html>.
The requirement is a terraform version `> 0.14`, this tutorial has been tested with `0.14.4`.
[Terraform `1.1.9` and `1.2.9` do not work](https://github.com/zonca/jupyterhub-deploy-kubernetes-jetstream/issues/46)

### Request API access

Follow [the instructions in the Jetstream 2 documentation to create application credentials](https://docs.jetstream-cloud.org/ui/cli/auth/#openrc-files-are-allocation-specific).

Also make sure you are not hitting any of the [issues in the Troubleshooting page](https://docs.jetstream-cloud.org/faq/trouble/), in particular, it is a good idea to set your password within single quotes to avoid special characters being interpreted by the shell:

    export OS_APPLICATION_CREDENTIAL_SECRET='xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'

Test with:

    openstack flavor list

This should return the list of available "sizes" of the Virtual Machines.

You also need to add to the `app*openrc.sh` also this line:

    export OS_APPLICATION_CREDENTIAL_NAME=$OS_APPLICATION_CREDENTIAL_ID

otherwise Ansible will fail with `you must either set external_openstack_username or external_openstack_application_credential_name`.

### Clone kubespray

We needed to make a few modifications to `kubespray` to adapt it to Jetstream:

    git clone https://github.com/zonca/jetstream_kubespray
    git checkout -b branch_v2.21.0 origin/branch_v2.21.0

See an [overview of my changes compared to the standard `kubespray` release 2.21.0](https://github.com/zonca/jetstream_kubespray/pull/21),

Inside `jetstream_kubespray`, choose a name for the cluster and copy from my template:

    export CLUSTER=yourclustername
    cp -r inventory/kubejetstream inventory/$CLUSTER
    cd inventory/$CLUSTER

also `export CLUSTER=yourclustername` is useful to add to the `app*openrc.sh`.

### Get a projects.jetstream-cloud.org subdomain

One option is to use the Designate Openstack service deployed by Jetstream to get an automatically created domain for the instances.
In this case the DNS name will be of the form:

    kubejetstream-1.$PROJ.projects.jetstream-cloud.org

where `PROJ` is the ID of your Jestream 2 allocation:

    export PROJ="xxx000000"

The first part of the URL is the instance name, we shortened it removing `k8s-master` because domains too long do not work with Letsencrypt.

Unfortunately the way Terraform creates the Openstack resources breaks the automatic assignment of a DNS record, however this can be easily fixed by disassociating and immediately reassociating the floating IP from the master node (and other nodes is useful):

    export IP= #paste from the output of Terraform
    openstack server remove floating ip $CLUSTER-1 $IP
    openstack server add floating ip $CLUSTER-1 $IP

After having executed Terraform, you can pip install on your local machine the package `python-designateclient` to check what records were created (mind the final period):

    openstack recordset list $PROJ.projects.jetstream-cloud.org.

As usual with stuff related to DNS, there are delays, so your record could take up to 1 hour to work, or if you delete the instance and create it again with another IP it could take hours to update.

For debugging purposes it is useful to use `nslookup`:

    nslookup ${CLUSTER}-1.$PROJ.projects.jetstream-cloud.org

also directly at the source nameservers:

    nslookup ${CLUSTER}-1.$PROJ.projects.jetstream-cloud.org js2.jetstream-cloud.org

Instead, if you have a way of getting a domain outside of Jetstream, better reserve a floating IP, see below.

### Reserve a floating IP

We prefer not to have a floating IP handled by Terraform, otherwise it would be released every time we need
to redeploy the cluster, better create it beforehand:

    openstack floating ip create public

This will return a public floating IP address, it can also be accessed with:

    openstack floating ip list

It is useful to save the IP into the `app*openrc.sh`, so that every time you load the credentials you also get the address of the master node.

    export IP=149.xxx.xxx.xxx

### Run Terraform

Open and modify `cluster.tfvars`, choose your image (by default Ubuntu 20) and number of nodes and the flavor of the nodes, by default they are medium instances (`"4"`).

Paste the floating ip created previously into `k8s_master_fips`, unless you are using a projects.jetstream-cloud.org subdomain.
Make also sure you add your auto allocated router ID, see instructions inside `cluster.tfvars`.

Initialize Terraform:

    bash terraform_init.sh

Create the resources:

    bash terraform_apply.sh

Terraform is very fast in building all the resources, sometimes resources are not ready yet, so the Apply command fails, just run it again, it happens regularly, nothing to worry about.

You can SSH into the master node with:

    ssh ubuntu@$IP

Inspect with Openstack the resources created:

    openstack server list
    openstack network list

You can cleanup the virtual machines and all other Openstack resources (all data is lost) with `bash terraform_destroy.sh`. The floating IP won't be released so we can create a cluster again from scratch with the same IP address.

## Install and test Ansible

Change folder back to the root of the `jetstream_kubespray` repository,

First make sure you have a recent version of `ansible` installed, tested with `2.10.15`, you also need additional modules,
so first run:

    pip install -r requirements.txt

This `pip` script installs a predefined version of ansible, currently `2.10.15`, so it is useful to create a `virtualenv` or a conda environment and install packages inside that.

Then following the [`kubespray` documentation](https://github.com/kubernetes-incubator/kubespray/blob/master/contrib/terraform/openstack/README.md#ansible), we setup `ssh-agent` so that `ansible` can SSH from the machine with public IP to the others:

    eval $(ssh-agent -s)
    ssh-add ~/.ssh/id_rsa

Test the connection through ansible:

    ansible -i inventory/$CLUSTER/hosts -m ping all

## Install Kubernetes with `kubespray`

In `inventory/$CLUSTER/group_vars/k8s_cluster/k8s-cluster.yml`, set the public floating IP of the master instance in `supplementary_addresses_in_ssl_keys`.

Finally run the full playbook, it is going to take a good 20 minutes:

    bash k8s_install.sh

If the playbook fails with "cannot lock the administrative directory", it is due to the fact that the Virtual Machine is automatically updating so it has locked the APT directory. Just wait a minute and launch it again. It is always safe to run `ansible` multiple times.

If the playbook gives any error, try to retry the above command, sometimes there are temporary failed tasks, Ansible is designed to be executed multiple times with consistent results.

You should have now a Kubernetes cluster running, test it:

```
$ ssh ubuntu@$IP
$ sudo su
$ kubectl get pods --all-namespaces
NAMESPACE       NAME                                           READY   STATUS    RESTARTS   AGE
ingress-nginx   ingress-nginx-controller-4xd64                 1/1     Running   0          27m
kube-system     coredns-8474476ff8-9gd8w                       1/1     Running   0          27m
kube-system     coredns-8474476ff8-qtshk                       1/1     Running   0          27m
kube-system     csi-cinder-controllerplugin-9fb5946bf-hwfhp    6/6     Running   0          26m
kube-system     csi-cinder-nodeplugin-r69nl                    3/3     Running   0          26m
kube-system     dns-autoscaler-5ffdc7f89d-s4sj4                1/1     Running   0          27m
kube-system     kube-apiserver-kubejs2-k8s-master-1            1/1     Running   1          66m
kube-system     kube-controller-manager-kubejs2-k8s-master-1   1/1     Running   1          66m
kube-system     kube-flannel-2clqv                             1/1     Running   0          29m
kube-system     kube-flannel-2wbtq                             1/1     Running   0          29m
kube-system     kube-proxy-hmz6t                               1/1     Running   0          30m
kube-system     kube-proxy-xkhjx                               1/1     Running   0          30m
kube-system     kube-scheduler-kubejs2-k8s-master-1            1/1     Running   1          66m
kube-system     nginx-proxy-kubejs2-k8s-node-1                 1/1     Running   0          64m
kube-system     nodelocaldns-jwxg8                             1/1     Running   0          27m
kube-system     nodelocaldns-z4sjl                             1/1     Running   0          27m
kube-system     openstack-cloud-controller-manager-6q28z       1/1     Running   0          29m
kube-system     snapshot-controller-786647474f-7x8zx           1/1     Running   0          25m

```

Compare that you have all those services running also in your cluster.
We have also configured NGINX to proxy any service that we will later deploy on Kubernetes,
test it with:

```
$ wget localhost
--2022-03-31 06:51:20--  http://localhost/
Resolving localhost (localhost)... 127.0.0.1
Connecting to localhost (localhost)|127.0.0.1|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2022-03-31 06:51:20 ERROR 404: Not Found.
```

Error 404 is a good sign, the service is up and serving requests, currently there is nothing to deliver.
If you get any other type of error, check that the `nginx` controller is running:

    kubectl get pods -n ingress-nginx

## Set the default storage class

This is not needed anymore, setting Cinder CSI as default storage class is included in the modifications to Kubespray.

## (Optional) Setup kubectl locally

Install `kubectl` locally, the tutorial has been tested with `1.26`.

We also set `kubeconfig_localhost: true`, which copies the `kubectl` configuration  `admin.conf` to:

    inventory/$CLUSTER/artifacts

We have a script to  replace the IP with the floating IP of the master node, for this script to work make sure you have exported the variable IP:

    bash k8s_configure_kubectl_locally.sh

Finally edit again the `app*openrc.sh` and add:

    export KUBECONFIG=$(pwd -P)/"jetstream_kubespray/inventory/$CLUSTER/artifacts/admin.conf"

## (Optional) Setup helm locally

Install helm 3 from [the release page on Github](https://github.com/helm/helm/releases)

The tutorial was tested with `v3.8.1`.
