# Manila - Filesystems-as-a-service - on Jetstream2

Manila is the file share service project for OpenStack. Manila provides the management of file shares for example, NFS and CIFS, as a core service to OpenStack. Manila works with a variety of proprietary backend storage arrays and appliances, with open source distributed filesystems, as well as with a base Linux NFS or Samba server.
With Manila, you can have multiple instances on Jetstream2 share a filesystem.

If you are not using a Jetstream2 Featured image, you'll need to make sure you have these packages installed on your instance: ceph-commons and ceph-fuse

You can set up and manage Manila shares via Horizon and the CLI presently:

 - [Manila via Horizon](../ui/horizon/manila.md)
 - [Manila via Openstack CLI](../ui/cli/manila.md)

 Once a Manila share is created, you can mount and use it on your VM managed from any valid Jetstream2 interface.

- [Configuring a VM to use Manila Shares](manilaVM.md)
