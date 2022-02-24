![cacao logo](images/cacao-logo.png){ width=128px }[Cacao Overview](overview.md) &gg; What is Cacao

# What is Cacao?

Cacao is a multi cloud orchestration service for researchers and educators that eliminates the complexity of using multiple clouds. By focusing on getting stuff done, Cacao helps transform research and education in a multi-cloud world.

![cyverse logo](images/cyverse-globe_dark-blue_64x54.png)Cacao is built and maintained by [CyVerse](https://www.cyverse.org), the NSF research project that created Atmosphere. 

## Why Cacao?

Cacao helps you use clouds with ease of use, flexibility, and collaboration.

### Ease of use

Cacao makes it convenient to use your XSEDE Jetstream 2 allocation on any Jetstream cloud. You can organize your Openstack resources -- servers, volumes, containers, and more -- into workspaces. At the basic level, you can use Cacao just as you did with Atmosphere on Jetstream 1: launch a vm with the tools you use, do your work, and shutdown when you're done.

![cacao home dashboard](images/home-dashboard.png)

### Flexibility (coming soon!) 

![something sweet coming soon](images/SweetA.png){ style="float: right;" width="128px" } Cacao helps adapt the cloud to fit your needs. Under the hood, your cloud resources are created using pre-defined [Hashicorp Terraform templates](https://www.terraform.io/intro/index.html). If you don't know Terraform, don't worry -- you don't need to know Terraform to use Cacao; however, you can create your own Openstack Terraform templates if you wish to level-up your Cacao workflow game. Future features in Cacao will include support for AWS/GCP/Azure+Terraform as well as non-Terraform-based templates, such as Kubernetes and Argo templates.

Cacao will also allow you to activate your resources when your data or workflow code changes and shutdown your resources after executing your workflow, in a [Continuous Analysis](https://github.com/greenelab/continuous_analysis) way.

### Collaboration (coming soon!)

![something sweet coming soon](images/SweetA.png){ style="float: right" width="128px" } Cacao makes collaboration in the cloud, less cloudy. You will be able share resources and workflows with the people you want. 

## What next?

If you are a new user to Cacao, [get started in using Cacao](getting_started.md)