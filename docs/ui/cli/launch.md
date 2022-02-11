# Launch and Access Your Instance

### Creating a Virtual Machine

| Create and launch a VM    | OpenStack Command |
|----- | ----- |
| See what flavors (sizes) are available | ```openstack flavor list``` |
| See what Images are available<br>The Jetstream team makes *** Featured-* ***<br> images available from which to build.| ```openstack image list``` |
| Create and boot an instance<br><span style="color:darkred">***Notes:***</span><br><br><ul><li>Make sure your SSH keyname matches</li><li>*your-instance-name* is the name of the<br>instance; make it something meaningful for you.</li><li>Choose an appropriate flavor from the list in the<br> first command</li>  <li>Choose an appropriate image from the list in the<br> second command</li>  | ```openstack server create my-server-name \```<br>```--flavor FLAVOR \```<br>```--image IMAGE-NAME \```<br>```--key-name my-keypair-name \```<br>```--security-group my-security-group-name \``` <br>```--wait```
| **Optional**<br><br>If you have multiple networks, you'll need<br> to also include this line <br><br> See [Create a network in the CLI](network.md) for more<br> information | <br>```--nic net-id=my-network-name``` |
| Create a public IP address for an instance    | ```openstack floating ip create public```|
| Add that public IP address with that instance | ```openstack server add floating ip my-server-name your.ip.number.here``` |

### Logging into your Virtual Machine

Once your instance is up and has a floating IP, you are ready to ssh in and use it. If your ssh key is one of the default names (e.g. id_rsa or id_ed25519) and is in your ~/.ssh dir, you won't need to specify the location of the key. Otherwise, you'll need to use the ssh option *-i path/key*. For example:

    ssh -i ~/.ssh/my-custom-key-name user@ip.number

Each distribution has a different default user. We will show examples for each without the -i path to your ssh key, assuming you have ~/.ssh/id_rsa or ~/.ssh/id_ed25519 as your default key:

For Ubuntu 18 or 20:

    ssh ubuntu@your.ip.number.here

For CentOS 7:

    ssh centos@your.ip.number.here

For Rocky 8:

    ssh rocky@your.ip.number.here

---

You should be able to access and use your VM now! Please see [Instance Management Actions in the CLI](manage.md) for all instance management actions.
