# Overview

There are many options and tools for using the OpenStack API from the command line. Follow the instructions in the table below to set up a security policy and network, launch and manage a VM and then remove the entire structure.

<span style="color:darkred">***Note:***</span> There is also an API tutorial that the Jetstream team uses here:[ Jetstream API Tutorial](https://github.com/jlf599/JetstreamAPITutorial) - this tutorial goes into greater detail on some topics and may be of value to those learning the Openstack CLI.

*Please note that the tutorial above presently reflects using the API on Jetstream1. It will be updated soon for Jetstream2*

### Important Notes

 * You should be running the latest version of the clients.  We recommend using python-openstack >= 5.0 as it uses Python3 and removes the dependencies on the now deprecated Python2.
 * It is possible to create entities with the same name; e.g. you could create two networks with the same name; however, they will have different UUIDs.  When this occurs you may get a cryptic error message about that entity may not exist or some other baffling error.  In this case, you must address the entity by its UUID.
 * In the examples below we often use ${OS_USERNAME}-api-whatnot to name an entity.  We do this so that a first time user could more or less cut and paste the example and create a working instance that is unique to you and to distinguish from other users in your project.
 * It is important to understand that everything is owned by the project.  Other users in your project can see and manipulate entities that you have created. Be careful in your naming and pay attention to the things you are manipulating.

### Getting Started

The first thing you'll need to do before being able to do any CLI commands is have an appropriate *openrc* file.

<span style="color:red">Please note that openrc files on Jetstream2 require *application credentials*. Please refer to the [Jetstream2 Openrc File](openrc.md) page for information on generating an application credential and openrc file.

##### Source the openrc:

```source openrc-file-name```

You can also make the output look nicer in your terminal with the --fit-width option:

```openstack image show Featured-Ubuntu20 --fit-width```

You can make that permanent by adding the following to your environment.

```export CLIFF_FIT_WIDTH=1```

You then need to do the following steps in the order listed below.

 - [Create a security group]()
 - [Create a network]()
 - [Create and launch a VM]()
 - [Instance management]()
 - [Clean up]()
