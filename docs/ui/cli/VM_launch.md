# Launch and Manage your Instance

# Creating a Virtual Machine

| Create and launch a VM    | OpenStack Command |
|----- | ----- |
| See what flavors (sizes) are available | ```openstack flavor list``` |
| See what Images are available for API use<br>The Jetstream team makes *** JS-API-Featured* *** <br>images available from which to build.| ```openstack image list --limit 1000``` |
| Create and boot an instance<br><span style="color:darkred">***Notes:***</span><br><br><ul><li>Make sure your SSH keyname matches</li><li>*${OS_USERNAME}-api-u-1* is the name of the<br>instance; make it something meaningful for you.</li>     | ```openstack server create ${OS_USERNAME}-api-U-1 \```<br>```--flavor m1.tiny \```<br>```--image IMAGE-NAME \```<br>```--key-name ${OS_USERNAME}-api-key \```<br>```--security-group ${OS_USERNAME}-global-ssh \```<br>```--nic net-id=${OS_USERNAME}-api-net``` |
| Create a public IP address for an instance    | ```openstack floating ip create public```|
| Add that public IP address with that instance | ```openstack server add floating ip ${OS_USERNAME}-api-U-1 your.ip.number.here``` |

# Logging into your Virtual Machine

| Things to do once the instance is running ||
| ----- | -----|
| You're ready to log in to the running instance<br>via ssh'ing into public IP  | ```ssh -i ${OS_USERNAME}-api-key centos@your.ip.number.here```<br><br> or <br><br>```ssh -i ${OS_USERNAME}-api-key ubuntu@your.ip.number.here``` |


# Instance Management

|Instance actions | OpenStack Command | 
| ----- | ----- |
| Reboot<br>Suspend<br>Stop<br>Shelve<br>  | ```openstack server reboot ${OS_USERNAME}-api-U-1```<br>```openstack server suspend ${OS_USERNAME}-api-U-1```<br>```openstack server stop ${OS_USERNAME}-api-U-1```<br>```openstack server shelve ${OS_USERNAME}-api-U-1```   |

# Cleaning up
| Clean up what was created above       | OpenStack Command   |
| ----- | ----- |
| Remove the public IP address from the instance | ```openstack server remove floating ip ${OS_USERNAME}-api-U-1 your.ip.number.here```  |
| Delete an instance    | ```openstack server delete ${OS_USERNAME}-api-U-1```  |
| Return the public IP address to the pool of IP numbers | ```openstack floating ip delete your.ip.number.here```        |

<span style="color:darkred">***Note:***</span> You often want to create infrastructure such as networks, subnets, routers, etc.<br>only once and not delete them. These entities are reusable by all members of your project.

| Clean up other entities     | Openstack Command |
| ---- | ---- |
| Disconnect the router from the gateway        | ```openstack router unset --external-gateway ${OS_USERNAME}-api-router```     |
| Delete the subnet from the router     | ```openstack router remove subnet ${OS_USERNAME}-api-router ${OS_USERNAME}-api-subnet1```     |
| Delete the router     | ```openstack router delete ${OS_USERNAME}-api-router```       |
