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


Please see [# Instance Management Actions in the CLI](manage.md) for all instance management actions.
