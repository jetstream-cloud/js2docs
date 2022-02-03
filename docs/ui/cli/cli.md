# Openstack CLI

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

| Create a security group<br>(Do this once on the primary cluster<br>before launching instances) 	| Command line 	|
|---	|---	|
| Create a security group that will enable<br>inbound ping & SSH.<br><br>For more info see, [SecurityGroups](https://wiki.openstack.org/wiki/Neutron/SecurityGroups)<br><br><span style="color:darkred">***Note:***</span> On OpenStack, the default is that<br>NO ports are open versus the traditional all<br>ports are open unless specifically closed. For this<br>reason,a security group must be established<br>and the SSH port opened in order to allow login. 	| ```openstack security group create --description "ssh & icmp enabled" ${OS_USERNAME}-global-ssh``` <br><br>```openstack security group rule create --protocol tcp --dst-port 22:22 --remote-ip 0.0.0.0/0 ${OS_USERNAME}-global-ssh``` <br><br>```openstack security group rule create --protocol icmp ${OS_USERNAME}-global-ssh``` 	|
|**Upload SSH key - do this once** 	|  	|
| If you have an SSH key upload id_rsa & <br>id_rsa.pub to nova<br><br><span style="color:darkred">***Note:***</span> Key filenames may vary 	| ```cd ~/.ssh```<br><br>```openstack keypair create --public-key id_rsa.pub ${OS_USERNAME}-api-key``` 	|
| If you don't have an SSH key then create a new<br>key and upload to nova. 	| ```ssh-keygen -b 2048 -t rsa -f ${OS_USERNAME}-api-key -P ""```<br><br>```openstack keypair create --public-key ${OS_USERNAME}-api-key.pub ${OS_USERNAME}-api-key``` 	|
| **Setup the network - do this once**  	||
| Create a private network 	|``` openstack network create ${OS_USERNAME}-api-net``` 	|
| Verify that the private network was created 	| ```openstack network list``` 	|
| Create a subnet within the private network<br>space 	| ```openstack subnet create --network ${OS_USERNAME}-api-net --subnet-range 10.0.0.0/24 ${OS_USERNAME}-api-subnet1``` 	|
| Verify that subnet was created 	| ```openstack subnet list``` 	|
| Create a router 	| ```openstack router create ${OS_USERNAME}-api-router``` 	|
| Connect the newly created subnet to the router 	| ```openstack router add subnet ${OS_USERNAME}-api-router ${OS_USERNAME}-api-subnet1``` 	|
| Connect the router to the gateway named <br>"public" 	| ```openstack router set --external-gateway public ${OS_USERNAME}-api-router``` 	|
| Verify that the router has been connected to the<br>gateway 	| ```openstack router show ${OS_USERNAME}-api-router``` 	|
| **Create and launch a VM** 	| **OpenStack Command** 	|
| See what flavors (sizes) are available 	| ```openstack flavor list``` 	|
| See what Images are available for API use<br>The Jetstream team makes *Featured* <br>images available from which to build. 	| ```openstack image list --limit 1000``` 	|
| Create and boot an instance<br>Notes:<br><br>1. Make sure your SSH keyname matches. <br>2. *${OS_USERNAME}-api-u-1* is the name of the<br>instance; make it something meaningful for you. 	| ```openstack server create ${OS_USERNAME}-api-U-1 \```<br>```--flavor m1.tiny \```<br>```--image IMAGE-NAME \```<br>```--key-name ${OS_USERNAME}-api-key \```<br>```--security-group ${OS_USERNAME}-global-ssh \```<br>```--nic net-id=${OS_USERNAME}-api-net```  	|
| Create a public IP address for an instance 	| ```openstack floating ip create public``` 	|
| Add that public IP address with that instance 	| ```openstack server add floating ip ${OS_USERNAME}-api-U-1 your.ip.number.here``` 	|
| **Things to do once the instance is running** 	|  	|
| You're ready to log in to the running instance<br>via ssh'ing into public IP 	| ```ssh -i ${OS_USERNAME}-api-key centos@your.ip.number.here```<br><br> or <br><br>```ssh -i ${OS_USERNAME}-api-key ubuntu@your.ip.number.here``` 	|
| Reboot, suspend, stop, or shelve an instance 	| ```openstack server reboot ${OS_USERNAME}-api-U-1```<br>```openstack server suspend ${OS_USERNAME}-api-U-1```<br>```openstack server stop ${OS_USERNAME}-api-U-1```<br>```openstack server shelve ${OS_USERNAME}-api-U-1```	|
| **Commands to clean up what was created above** 	|  	|
| Remove the public IP address from the instance 	| ```openstack server remove floating ip ${OS_USERNAME}-api-U-1 your.ip.number.here``` 	|
| Delete an instance 	| ```openstack server delete ${OS_USERNAME}-api-U-1``` 	|
| Return the public IP address to the pool of IP numbers 	| ```openstack floating ip delete your.ip.number.here``` 	|
| **Clean up commands for other entities.** 	| <span style="color:darkred">***Note:***</span> You often want to create infrastructure such as networks, subnets, routers, etc.<br>only once and not delete them. These entities are reusable by all members of your project. 	|
| Disconnect the router from the gateway 	| ```openstack router unset --external-gateway ${OS_USERNAME}-api-router``` 	|
| Delete the subnet from the router 	| ```openstack router remove subnet ${OS_USERNAME}-api-router ${OS_USERNAME}-api-subnet1``` 	|
| Delete the router 	| ```openstack router delete ${OS_USERNAME}-api-router``` 	|
