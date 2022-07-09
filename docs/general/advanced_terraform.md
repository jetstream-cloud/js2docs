# Advanced Terraform

This topics is for more advanced users looking to expand what terraform can do.
The following examples assume that you have created an app credential and have [installed terraform](terraform.md).

The following link is to a repo with some more examples of what terraform can do:

[https://github.com/wellsaar/terraform-js2](https://github.com/wellsaar/terraform-js2){target=_blank}

A brief overview of the code is below:

# Nginx and Mariadb

This creates an ubuntu 20 server with nginx and mariadb installed and running, with a simple "Hello World!" webpage served as the index. This is a easy way to setup and have a baseline configuration for a web server.

## Requirements

Set your key_pair in ubuntu20.tfvars

If would like the change the flavor of the instance you boot, add the following to ubuntu20.tfvars
```
flavor_id = "ID of flavor here"
```
You can see the list of flavor with the following command.

```
openstack flavor list
```


# R + Shiny server (Nginx proxy)

This creates an ubuntu 20 server with nginx, r and shiny server installed and configure the nginx server for SSL (using certbot) and reverse proxies back shiny to port 443 (https).


You can specify which version of shiny you want by editing shiny_version in ansible/main.yml

## Requirements

Set your key_pair in ubuntu20.tfvars

Set your email address for certbot

Specify your domain_name, more often then not your domain name will be
```
shiny.(Jetstream Allocation Name).projects.jetstream-cloud.org
```
If you would like to change your flavor, see above.

# Kubernetes Cluster

This repo located below will setup a Kubernetes cluster with the amount of followers you specific.

Currently this is running on Ubuntu 20 and installs the latest version of kubernetes.

```
https://github.com/wellsaar/terraform-js2-k8cluster
```

## Requirements

Editing k8.tfvars with your public key as well.
If you would like to change the flavor or amount of followers in your cluster you can do so in k8.tfvars.
