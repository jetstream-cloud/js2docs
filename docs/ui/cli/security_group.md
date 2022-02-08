# Manage Security Groups in the CLI

Security groups can be thought of like firewalls. They ultimately control inbound and outbound traffic to your virtual machines. Under the CLI and Horizon, access defaults to all outbound allowed and **NO** inbound allowed.

To allow access to your VM for things like SSH, you will need to create a security group and add rules to it.

> You can reuse a security group many times, so a best practice is to create groups by related services. For insance, you might create a basic group for ssh and icmp (which is what we will show as an example) and then a separate security group for http and https access if you're running a web service on your instance.

#### Create a security group that will enable inbound ping & SSH:

This will walk you through creating a basic security group on the command line and adding a couple of simple access rules.

> openstack security group create --description "ssh & icmp enabled" my-username-ssh-and-icmp-access

This creates the security group named *my-username-ssh-and-icmp-access* with the description noted above. It becomes the container for holding security group rules.

> openstack security group rule create --protocol tcp --dst-port 22:22 --remote-ip 0.0.0.0/0 my-username-ssh-and-icmp-access

This creates an SSH access rule, allowing inbound TCP protocol to port 22 from any IP number.

> openstack security group rule create --protocol icmp my-username-ssh-and-icmp-access

This creates an ICMP (most notably ping) access rule, allowing inbound ICMP protocol from any IP number.

You can then add additional rules or additional security groups. This will allow the most basic of access to your VMs. **We do recommend limiting access as much as possible for best security practices.** 

---

Please refer to the Openstack doc for more information: [Security Groups](https://docs.openstack.org/python-openstackclient/xena/cli/command-objects/security-group.html){target=_blank}

Also, as with all openstack CLI commands, you can type *openstack help item* to get more information on the options and syntax.
