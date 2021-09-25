# Create network

| Setup the network - do this once | OpenStack Command |
|---- | ----| 
| Create a private network |``` openstack network create ${OS_USERNAME}-api-net```|
| Verify that the private network was created | ```openstack network list```  |
| Create a subnet within the private network<br>space | ```openstack subnet create --network ${OS_USERNAME}-api-net --subnet-range 10.0.0.0/24 ${OS_USERNAME}-api-subnet1```  |
| Verify that subnet was created | ```openstack subnet list```   |
| Create a router | ```openstack router create ${OS_USERNAME}-api-router``` |
| Connect the newly created subnet to the router | ```openstack router add subnet ${OS_USERNAME}-api-router ${OS_USERNAME}-api-subnet1``` |
| Connect the router to the gateway named <br>"public"  | ```openstack router set --external-gateway public ${OS_USERNAME}-api-router``` |
| Verify that the router has been connected to the<br>gateway   | ```openstack router show ${OS_USERNAME}-api-router``` |

