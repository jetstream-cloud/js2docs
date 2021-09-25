# Create Security Group 

| Create a security group<br>(Do this once at IU and/or TACC<br>before launching instances)     | OpenStack Command  |
|---    |---    |
| Create a security group that will enable<br>inbound ping & SSH.<br><br>For more info see, [SecurityGroups](https://wiki.openstack.org/wiki/Neutron/SecurityGroups)<br><br><span style="color:darkred">***Note:***</span> On OpenStack, the default is that<br>NO ports are open versus the traditional all<br>ports are open unless specifically closed. For this<br>reason,a security group must be established<br>and the SSH port opened in order to allow login.  | ```openstack security group create --description "ssh & icmp enabled" ${OS_USERNAME}-global-ssh``` <br><br>```openstack security group rule create --protocol tcp --dst-port 22:22 --remote-ip 0.0.0.0/0 ${OS_USERNAME}-global-ssh``` <br><br>```openstack security group rule create --protocol icmp ${OS_USERNAME}-global-ssh```    |

# Upload SSH key - do this once

If you have an SSH key upload id_rsa & id_rsa.pub to nova. <br>
<span style="color:darkred">***Note:***</span> Key filenames may vary.<br> 
```cd ~/.ssh```<br>
```openstack keypair create --public-key id_rsa.pub ${OS_USERNAME}-api-key```<br>

If you don't have an SSH key then create a new key and upload to nova.<br>
```ssh-keygen -b 2048 -t rsa -f ${OS_USERNAME}-api-key -P ""```<br>
```openstack keypair create --public-key ${OS_USERNAME}-api-key.pub ${OS_USERNAME}-api-key```  

