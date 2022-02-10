# Instance Management Actions in the CLI

Once you have an instance, you may need to stop, start, or do other actions with it. You may wish to review [XSEDE Service Units and Jetstream2](../../general/xsede.md) for more information about the "costs" of the various states of Jetstream2 virtual machines.

### Rebooting

If your instance is running and you need to reboot/restart it, you can do so from the instance itself by doing:

    sudo shutdown -r now

You can also do it from the CLI with the command:

    openstack server reboot my-server-name-or-UUID
    openstack server reboot my-server-name-or-UUID --hard

### Stopping and starting

Stopping an instance is equivalent to powering down your laptop. We recommend this as a means to conserve SUs when you are done working but plan to use your VM in the next day or two.

You can stop the instance from it's own command line by doing

    sudo shutdown -h now

You can accomplish the same thing from the CLI with:

    openstack server stop my-server-name-or-UUID

and start it again with:

    openstack server start my-server-name-or-UUID

Note that state is not retained and that resources are still reserved on the compute host so that when you decide restart the instance, resources are available to activate the instance.

### Suspending and resuming

Another option for conserving *some* SUs is suspending your instance. Suspending is similar to closing the lid on your laptop. We generally do not recommend using suspend, but if you opt to use it, we would recommend only using it when you want to conserve some SUs but plan to come back to work with your VM soon.

    openstack server suspend my-server-name-or-UUID

and then resume it again with:

    openstack server resume my-server-name-or-UUID

Note that resources are still reserved on the compute host for when you decide restart the instance.

### Shelving and unshelving

The last management option is shelving. This shuts down the instance down and moves to storage. Memory state is not maintained. Contents of your root disk is maintained. This is the most economical state for an unused VM as there are no SU charges for shelved VMs since it removes the VM from the hypervisor entirely. We recommend using shelving when you are done with a VM for multiple days or weeks.

    openstack server shelve my-server-name-or-UUID

and unshelve it with:

    openstack server unshelve my-server-name-or-UUID
