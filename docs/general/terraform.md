# Terraform on Jetstream2

Terraform is a open-source code as infrastructure tool that works with Jetstream2
and allows you to build and destroy infrastructure quickly and easily.

# Installing Terraform

The documentation to install Terraform is located below. We have linked to the latest documentation
from the Terraform team.

[https://www.terraform.io/downloads](https://www.terraform.io/downloads)

## Basic Operations

The basic setup is as follows:

1. Git clone the terraform repo
2. Download the openrc file into the repo
3. Run source openrc.sh
4. Initalize Terraform with terraform init
5. See what changes Terraform wants to make to your infrastructure with terraform plan
6. Apply the changes with terraform apply


### Getting started with git
If you are unfamiliar with git, the documentation is located here [git-scm](https://git-scm.com/book/en/v2)

### Git clone

Git clone allows you create a copy of a git repo that creates the directory and checks out the active branch.

```
git clone git@github.iu.edu:wellsaar/terraform-jetstream.git
```
This command creates a clone of the git repo that contains the code examples that we use below. The master branch of the git repo above should be a good starting point in developing your own terraform code.

# Running Terraform
Make sure that you have setup and downloaded your openrc file. [Setting up the openrc.sh for the Jetstream2 CLI](../../ui/cli/openrc)

You will need to source the openrc file once you have downloaded it in order to setup the variables that Terraform will need to connect to Jetstream2.


### Terraform Init


```
terraform init
```

This is the first command that should be run after writing a new Terraform configuration or cloning an existing one. This command is used to initialize a working directory containing Terraform configuration files.


[Terraform Init Documentation](https://www.terraform.io/cli/commands/init)


*Example Terraform Init*
```
terraform-jetstream git: (jetstream2) x terraform init
Initializing the backend..
Initializing provider plugins.

- Reusing previous version of terraform-provider-openstack/openstack from the dependency lock file
- Using previously-installed terraform-provider-openstack/openstackv1.42.0
Terraform has been successfully initialized!
1 You may now begin working with Terraform. Try running
"terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.
• If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

In this example, we have already initialized Terraform in this directory, and Terraform is checking the dependency lock file for any updates. You will need to run Terraform init if you make any changes to providers.

### Terraform Plan

```
terraform plan
```
This command creates an execution plan which allows you to preview the changes that Terraform will change. The screenshot below is only a small section of output of a plan.


[Terraform Plan Documentation](https://www.terraform.io/cli/commands/plan)

*Example Terraform Plan*
```
# openstack_networking_subnet_v2.terraform_subnet1 will be created
+ resource "openstack_networking_subnet_v2" "terraform_subnet1" {
    + all_tags          = (known after apply)
    + cidr              = "192.168.0.0/24"
    + enable_dhcp       = true
    + gateway_ip        = (known after apply)
    + id                = (known after apply)
    + ip_version        = 4
    + ipv6_address_mode = (known after apply)
    + ipv6_ra_mode      = (known after apply)
    + name              = "terraform_subnet1"
    + network_id        = (known after apply)
    + no_gateway        = false
    + region            = (known after apply)
    + tenant_id         = (known after apply)

    + allocation_pool {
        + end   = (known after apply)
        + start = (known after apply)
      }

    + allocation_pools {
        + end   = (known after apply)
        + start = (known after apply)
      }
  }

Plan: 8 to add, 0 to change, 0 to destroy.

Changes to Outputs:
+ floating_ip_ubuntu20 = [
    + (known after apply),
  ]

────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
```

In this example, due to space issues only the networking section is shown. The resource section in the example lists how the resource will be configured, including any tags and the name of the resource.

You can see on the Plan: line that 14 items will be added, 0 will be changed and 0 will be destroyed.

### Terraform Apply

```
terraform apply
```

This command makes changes based on what's defined in the Terraform files and what's existing in your infrastructure already.

[Terraform Apply Documentation](https://www.terraform.io/cli/commands/apply)


*Example Terraform Apply*
```
# openstack_networking_subnet_v2.terraform_subnet1 will be created
+ resource "openstack_networking_subnet_v2" "terraform_subnet1" {
    + all_tags          = (known after apply)
    + cidr              = "192.168.0.0/24"
    + enable_dhcp       = true
    + gateway_ip        = (known after apply)
    + id                = (known after apply)
    + ip_version        = 4
    + ipv6_address_mode = (known after apply)
    + ipv6_ra_mode      = (known after apply)
    + name              = "terraform_subnet1"
    + network_id        = (known after apply)
    + no_gateway        = false
    + region            = (known after apply)
    + tenant_id         = (known after apply)

    + allocation_pool {
        + end   = (known after apply)
        + start = (known after apply)
      }

    + allocation_pools {
        + end   = (known after apply)
        + start = (known after apply)
      }
  }

Plan: 8 to add, 0 to change, 0 to destroy.

Changes to Outputs:
+ floating_ip_ubuntu20 = [
    + (known after apply),
  ]

Do you want to perform these actions?
Terraform will perform the actions described above.
Only 'yes' will be accepted to approve.

Enter a value: yes
```

## Writing YAML files and Validating YAML files

Terraform code is written in YAML (YAML Ain't Markup Language). Indentation matters with YAML so listed below are some free tools that will help you write in YAML.


* [yamllint](http://www.yamllint.com)

* [atom.io](https://atom.io/)
