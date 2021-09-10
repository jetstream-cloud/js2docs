# Openstack CLI

There are many options and tools for using the OpenStack API from the command line. Follow the instructions in the table below to set up a security policy and network, launch and manage a VM and then remove the entire structure.
  
***Note:*** There is also an API tutorial that the Jetstream team uses here: https://github.com/jlf599/JetstreamAPITutorial - this tutorial goes into greater detail on some topics and may be of value to those learning the Openstack CLI.

***Notes:***

 - You should be running the latest version of the clients.  We recommend using python-openstack >= 4.0 as it uses Python3 and removes the dependencies on the now deprecated Python2.
 - It is possible to create entities with the same name; e.g. you could create two networks with the same name; however, they will have different UUIDs.  When this occurs you may get a cryptic error message about that entity may not exist or some other baffling error.  In this case, you must address the entity by its UUID. 
 - In the examples below we often use ${OS_USERNAME}-api-whatnot to name an entity.  We do this so that a first time user could more or less cut and paste the example and create a working instance that is unique to you and to distinguish from other users in your project.
 - It is important to understand that everything is owned by the project.  Other users in your project can see and manipulate entities that you have created. Be careful in your naming and pay attention to the things you are manipulating.


The first thing you'll need to do before being able to do any CLI commands is source the openrc file you created. {Add Link here} 

```source openrc-file-name```

You can also make the output look nicer in your terminal with the --fit-width option:

```openstack image show JS-API-Featured-Centos7-Latest --fit-width```

You can make that permanent by adding the following to your environment.

```export CLIFF_FIT_WIDTH=1```

| Create a security group<br>(Do this once at IU and/or TACC before launching instances)| Command line |
| ---------------------------------------------------------------------------------- | ------------ |
| Create a security group that will enable inbound ping & SSH.<br><br>For more info see,<br>https://wiki.openstack.org/wiki/Neutron/SecurityGroups<br><br> *Important note:* On OpenStack, the default is that NO ports<br>are open versus the traditional all ports are open unless<br>specifically closed. For this reason,<br>a security group must be established<br>and the SSH port opened in order to allow login. | openstack security group create --description "ssh & icmp enabled" ${OS_USERNAME}-global-ssh |

