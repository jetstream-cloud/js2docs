# Deleting VMs and other infrastructure in the CLI

When you're done with a VM, you'll want to remove the floating IP and return it to the pool if you aren't going to reuse it. Then you can delete an instance you no longer need.

We're providing instructions for deleting routers, subnets, and networks, as well, though you can keep those and reuse them. Network infrastructure does not incur any SU charges to leave though it will count against Openstack resource quotas.

There are a very limited number of IPs available. Please return any you are not using!
{: .note}

| Clean up what was created above       | OpenStack Command   |
| ----- | ----- |
| Remove the public IP address from the instance | ```openstack server remove floating ip your-unneeded-instance your.ip.number.here```  |
| Delete an instance    | ```openstack server delete your-unneeded-instance```  |
| Return the public IP address to the pool of IP numbers | ```openstack floating ip delete your.ip.number.here```        |

<span style="color:darkred">***Note:***</span> You often want to create infrastructure such as networks, subnets, routers, etc. only once and not delete them.<br>    These entities are reusable by all members of your project.

| Clean up other entities     | Openstack Command |
| ---- | ---- |
| Disconnect the router from the gateway        | ```openstack router unset --external-gateway my-router-name```     |
| Delete the subnet from the router     | ```openstack router remove subnet my-router-name my-subnet-name```     |
| Delete the router     | ```openstack router delete my-router-name```       |
| Delete the subnet   |  ```openstack router delete my-subnet-name```  |
| Delete the network   |  ```openstack router delete my-network-name```  |
