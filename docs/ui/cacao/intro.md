![cacao logo](images/cacao-logo.png){ width=128px }[CACAO Overview](overview.md) &gg; What is CACAO

# What is CACAO?

CACAO, Cloud Automation and Continuous Analysis Orchestration, is an orchestration service for researchers and educators that eliminates the complexity of using multiple clouds. By focusing on getting stuff done, CACAO helps transform research and education in a multi-cloud world.

![cyverse logo](images/cyverse-globe_dark-blue_64x54.png)CACAO is built and maintained by [CyVerse](https://www.cyverse.org), the NSF research project that created Atmosphere.

## Why CACAO?

CACAO helps you use clouds with ease of use, flexibility, and collaboration.

### Ease of use

CACAO makes it convenient to use your ACCESS Jetstream 2 allocation on any Jetstream cloud. You can organize your Openstack resources -- servers, volumes, containers, and more -- by project. You can use CACAO on Jetstream 2 to create simple deployments: launch a vm with the tools you use, do your work, and delete those resources when you're done. You can also use CACAO to create other more complex deployments that require the orchestration of mutiple servers and storage, such as a JupyterHub for a workshop or a Kubernetes cluster. CACAO already has some templates that are curated by CyVerse, or you can create your own templates.

![cacao home dashboard](images/home-dashboard.png)

### Flexibility

CACAO helps adapt the cloud to fit your needs. Under the hood, your cloud resources are created using pre-defined [Hashicorp Terraform templates](https://www.terraform.io/intro/index.html). If you don't know Terraform, don't worry -- you don't need to know Terraform to use CACAO; however, you can create your own Openstack Terraform templates if you wish to level-up your CACAO workflow game. Future features in CACAO will include support for AWS/GCP/Azure Terraform as well as non-Terraform-based templates, such as native Kubernetes or Nextflow templates.

CACAO will also allow you to activate your resources when your data or workflow code changes and shutdown your resources after executing your workflow, in a [Continuous Analysis](https://github.com/greenelab/continuous_analysis) way.

### Collaboration (coming soon!)

![something sweet coming soon](images/SweetA.png){ style="float: right" width="128px" } CACAO makes collaboration in the cloud, less cloudy. You will be able share resources and workflows with the people you want. 

## What next?

If you are a new user to CACAO, [get started in using Cacao](getting_started.md)