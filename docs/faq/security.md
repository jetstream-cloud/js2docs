#Security FAQ

### Do I need to patch/update my VMs?

The featured images provided by the Jetstream team have unattended security updates enabled. Instances will not reboot, but they will apply any update marked as a security update.  It's still a good idea to update your VM periodically.

CentOS 7: *sudo yum update*

Rocky 8: *sudo dnf update*

Ubuntu: *sudo apt-get update ; sudo apt-get upgrade*

If the kernel or glibc/libc packages are being updated, rebooting is necessary to implement those updates

Always run updates before taking snapshots so your new instances will have the latest patches in place.

### Do I need to secure services running on my VMs?

If you have a public IP (also called a floating IP in OpenStack terminology), your instance may be exposed to the internet. While you can use security groups or host-based firewalls like iptables or UFW to limit access, it's best to take a posture of defense in depth and always secure any listening services.

We recommend limiting access to any service ports via security group and/or firewall in addition to making sure any non-public services like databases have secure passwords for all accounts. If your service only needs to be accessible to the VM it's running on, check the documentation to see if it can be bound only to the localhost port. (Not all services have this ability.)

### What is the default security profile for Jetstream2 VMs?

That depends on the interface.

The CLI and Horizon by default allow egress only. You have to apply the appropriate security groups for ingress. Please refer to the [CLI](../ui/cli/security_group.md) or [Horizon](../ui/horizon/security_group.md) for more information on managing security groups in those interfaces.

For Exosphere, the default security group allows all egress and inbound access.

For CACAO, the default security group allows all egress and inbound access for X.
