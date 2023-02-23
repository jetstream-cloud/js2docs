# Command Line Interface (CLI) Overview

There are many options and tools for using the OpenStack API from the command line. Follow the instructions in the table below to set up a security policy and network, launch and manage a VM and then remove the entire structure.

<span style="color:darkred">***Note:***</span> There is also an API tutorial that the Jetstream team uses here:[ Jetstream API Tutorial](https://github.com/jlf599/JetstreamAPITutorial) - this tutorial goes into greater detail on some topics and may be of value to those learning the Openstack CLI.

> _Please note that the tutorial above presently reflects using the API on Jetstream1. It will be updated soon for Jetstream2_
{: .note}

### Important Notes

 * It is possible to create entities with the same name; e.g. you could create two networks with the same name; however, they will have different ***Universally Unique Indentifiers*** (UUIDs).  When this occurs you may get a cryptic error message about that entity may not exist or that there are multiple entities with that name.  In this case, you must address the entity by its UUID.
 * It is important to understand that everything is owned by the project.  Other users in your project can see and manipulate entities that you have created. *Be careful in your naming and pay attention to the things you are manipulating.*

### Getting Started

You should be running the latest version of the clients.  We recommend using python-openstack >= 5.0 as it uses Python3 and removes the dependencies on the now deprecated Python2. See [Installing Openstack Clients](clients.md) for more information.

The next thing you'll need to do before being able to do any CLI commands is have an appropriate *openrc* file. See [Authentication (Logging In)](auth.md) for more information.

You can make the output look nicer in your terminal with the --fit-width option:

    openstack image show Featured-Ubuntu20 --fit-width

Optionally, you can make that permanent by adding the following to your environment.

    export CLIFF_FIT_WIDTH=1

You'll then need to register an ssh key, create a security group and network before launching your first VMs. More information may be found here:

 - [Register an SSH key](managing-ssh-keys.md)
 - [Create a security group](security_group.md)
 - [Create a network](network.md)
 - [Create and launch a VM](launch.md)
 - [Instance management](manage.md)
