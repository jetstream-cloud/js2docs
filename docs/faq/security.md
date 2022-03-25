#Security FAQ

### Do I need to patch/update my VMs?

The featured images provided by the Jetstream team have unattended security updates enabled. Instances will not reboot, but they will apply any update marked as a security update.  It's still a good idea to update your VM periodically.

CentOS 7: *sudo yum update*

Rocky 8: *sudo dnf update*

Ubuntu: *sudo apt-get update ; sudo apt-get upgrade*

If the kernel or glibc/libc packages are being updated, rebooting is necessary to implement those updates

Always run updates before taking snapshots so your new instances will have the latest patches in place.

---

### Do I need to secure services running on my VMs?

If you have a public IP (also called a floating IP in OpenStack terminology), your instance may be exposed to the internet. While you can use security groups or host-based firewalls like iptables or UFW to limit access, it's best to take a posture of defense in depth and always secure any listening services.

We recommend limiting access to any service ports via security group and/or firewall in addition to making sure any non-public services like databases have secure passwords for all accounts. If your service only needs to be accessible to the VM it's running on, check the documentation to see if it can be bound only to the localhost port. (Not all services have this ability.)

---

### What is the default security profile for Jetstream2 VMs?

That depends on the interface.

The CLI and Horizon by default allow egress only. You have to apply the appropriate security groups for ingress. Please refer to the [CLI](../ui/cli/security_group.md) or [Horizon](../ui/horizon/security_group.md) for more information on managing security groups in those interfaces.

For Exosphere, the default security group allows all egress and inbound access.

For CACAO, the default security group allows all egress and inbound access for X.

---

### In Exosphere, there is a way to get a passphrase for any instance. Can I prevent other users on my allocation from accessing my instance(s)?

The way Jetstream2 is currently architected, all users on an allocation have access to all resources on the allocation. By default, Exosphere hides some resources created by other users, but this is only a convenience and it cannot assure separation of access.

It is possible to make it less straightforward for another user on the same allocation to access your running instance. You can do this by changing the password for the default exouser account. Changing the password does not prevent any access, but makes it more difficult. (Note that currently, changing the exouser account password will break Web Shell, Web Desktop, and some other Exosphere-powered instance interactions. This may change in the future.)

We note how to change a user password here:

https://docs.jetstream-cloud.org/faq/general-faq/#can-i-set-the-password-for-a-user-on-my-virtual-machine

you can do:

`sudo passwd exouser`

and that solves the issue of them being able to access your instance using the credential listed on the Exosphere page. I would HIGHLY suggest utilizing ssh keys for your instances to ensure you have access. That's covered here:

https://docs.jetstream-cloud.org/ui/exo/create_instance/

under the advanced options. You can also manually add your key to an already running instance.
