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

|**Create a security group<br>(Do this once at IU and/or TACC<br>before launching instances)**| **Command line**|
| ---------------------------------------------------------------------------------- | ------------ |
| Create a security group that will enable<br>inbound ping & SSH.<br><br>For more info see, [SecurityGroups](https://wiki.openstack.org/wiki/Neutron/SecurityGroups)<br><br> *Important note:* On OpenStack, the default is that<br>NO ports are open versus the traditional all<br>ports are open unless specifically closed. For this<br>reason,a security group must be established<br> and the SSH port opened in order to allow login. |```openstack security group create --description "ssh & icmp enabled" ${OS_USERNAME}-global-ssh``` <br><br>```openstack security group rule create --protocol tcp --dst-port 22:22 --remote-ip 0.0.0.0/0 ${OS_USERNAME}-global-ssh```<br><br>```openstack security group rule create --protocol icmp ${OS_USERNAME}-global-ssh```|
|**Upload SSH key - do this once** |  |
|If you have an SSH key upload id_rsa & <br>id_rsa.pub to nova<br><br>(note: Key filenames may vary)<br> | ```cd ~/.ssh```<br><br>```openstack keypair create --public-key id_rsa.pub ${OS_USERNAME}-api-key``` |
If you don't have an SSH key then create a new<br>key and upload to nova.<br>|```ssh-keygen -b 2048 -t rsa -f ${OS_USERNAME}-api-key -P ""```<br><br>```openstack keypair create --public-key ${OS_USERNAME}-api-key.pub ${OS_USERNAME}-api-key```|
|**Setup the network - do this once** | **OpenStack Command** | 
|Create a private network |```openstack network create ${OS_USERNAME}-api-net```|
|Verify that the private network was created | ```openstack network list``` | 
|Create a subnet within the private network<br>space | ```openstack subnet create --network ${OS_USERNAME}-api-net --subnet-range 10.0.0.0/24 ${OS_USERNAME}-api-subnet1``` | 
|Verify that subnet was created | ```openstack subnet list``` | 
|Create a router | ```openstack router create ${OS_USERNAME}-api-router``` |
|Connect the newly created subnet to the router | ```openstack router add subnet ${OS_USERNAME}-api-router ${OS_USERNAME}-api-subnet1```|
|Connect the router to the gateway named <br> "public" | ```openstack router set --external-gateway public ${OS_USERNAME}-api-router``` | 
|Verify that the router has been connected to the<br>gateway|```openstack router show ${OS_USERNAME}-api-router```|
|**Create and launch a VM**| **OpenStack Command** |
|See what flavors (sizes) are available | ```openstack flavor list```|
|See what Images are available for API use<br>The Jetstream team makes *** JS-API-Featured* *** <br>images available from which to build.|```openstack image list --limit 1000  |  grep JS-API-Featured```|
|Create and boot an instance<br>*Notes:*<br><br>1.   Make sure your SSH keyname matches. <br>2.   ${OS_USERNAME}-api-u-1 is the name of the<br>instance; make it something meaningful for you.| ```openstack server create ${OS_USERNAME}-api-U-1 \```<br>```--flavor m1.tiny \```<br>```--image IMAGE-NAME \```<br>```--key-name ${OS_USERNAME}-api-key \```<br>```--security-group ${OS_USERNAME}-global-ssh \```<br>```--nic net-id=${OS_USERNAME}-api-net``` <br>|

 
