# Firewalls

Jetstream2 staff encourages a defense-in-depth approach to security. This potentially involves several methods of restricting access and securing instances.

Firewalls are not enabled by default on Jetstream2 instances. Depending on the user interface you launched your instance from, you may have different security groups established for your instance. (See [What is the default security profile for Jetstream2 VMs?](https://docs.jetstream-cloud.org/faq/security/#what-is-the-default-security-profile-for-jetstream2-vms) for more information on that.)

We encourage keeping your instances patched, rebooting as needed for any kernel or glibc patches, limiting access to all services as much as possible, utilizing security groups if your interface allows it, and running your own host-based firewall if you're comfortable administering it.

If you are comfortable administering a firewall, we would encourage you to read the following tutorials for their respect Linux variants. Ubuntu's UFW (Uncomplicated FireWall) is very simple to use, though making sure you leave SSH access open is crucial (and often missed by first time UFW users) so you do not lock yourself out of your virtual machine.

##### Ubuntu 20 and 18

[How to Set Up a Firewall with UFW on Ubuntu 20.04](https://linuxize.com/post/how-to-setup-a-firewall-with-ufw-on-ubuntu-20-04/){target=_blank} is a good initial tutorial for setting up UFW.

#### Rocky 8 / Alma 8 / CentOS 7

The Redhat variants are a little less user friendly.

[How to Open or close ports in AlmaLinux 8 or Rocky Firewall](https://www.how2shout.com/linux/how-to-open-or-close-ports-in-almalinux-8-or-rocky-firewall/){target=_blank} is a good reference for getting started with firewalld.

[How to Set Up a Firewall with FirewallD on CentOS 7](https://linuxize.com/post/how-to-setup-a-firewall-with-firewalld-on-centos-7/){target=_blank} will get you started with firewalld on CentOS 7
