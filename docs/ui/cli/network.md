# Create a network in the CLI

In Jetstream2, if you do not need multiple networks in your allocation, you can skip all of the steps below. However, if there's more than one network in your allocation already, you will either need to use one of those or create your own network using these steps.
{: .note}

This step creates a virtual network for your instances. You'll create a network, a subnet, and a router and then set the routing so your instances can talk outside of the Jetstream2 networks to the world. You can have multiple networks in an allocation or also multiple subnets on a single network. This effectively isolates instances from each other.

If you do not give your instances a public IP address (also called a floating ip by Openstack), your instances will not be reachable from the internet. While this is not a substitute for proper [security groups](security_group.md), it is another level of protection for VMs that may used internally only by your VMs (e.g. private database servers).

| Setup the network | OpenStack Command |
|---- | ----|
| Create a private network |``` openstack network create my-network-name [--dns-domain tg-xxxxxxxx.projects.jetstream-cloud.org]```|
| (Optional)   | The --dns-domain is optional but recommended. <br><br> You will need to install <i>python-designateclient</i> for dns services. <br><br> Substitute your allocation number for the Xs above  |
| Verify that the private network was created | ```openstack network list```  |
| Create a subnet within the private network<br>space | ```openstack subnet create --network my-network-name --subnet-range 10.0.0.0/24 my-subnet-name```  |
| Verify that subnet was created | ```openstack subnet list```   |
| Create a router | ```openstack router create my-router-name``` |
| Connect the newly created subnet to the router | ```openstack router add subnet my-router-name my-subnet-name``` |
| Connect the router to the gateway named <br>"public"  | ```openstack router set --external-gateway public my-router-name``` |
| Verify that the router has been connected to the<br>gateway   | ```openstack router show my-router-name``` |
