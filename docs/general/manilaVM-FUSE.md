# Configuring a Ceph FUSE client

While most clients will use the native kernel ceph client, there may be times where you want to use the FUSE client for rate limiting or if requested by the Jetstream2 team.

You will need the `ceph-fuse` rpm if not already installed. You can install it with:

    dnf install ceph-fuse

for Redhat-Based OSes like Rocky and Alma. For Ubuntu, you can install it with:

    apt-get install ceph-fuse

To mount the manila share created previously you need to edit the three files listed below :

i. /etc/ceph/ceph.conf

```
[global]
admin socket = /var/run/ceph/$cluster-$name-$pid.asok
client reconnect stale = true
debug client = 0/2
fuse big writes = true
mon host = 149.165.158.38:6789,149.165.158.22:6789,149.165.158.54:6789,149.165.158.70:6789,149    .165.158.86:6789
```

where the mon host information is provided to you as part of the manila share.

ii. /etc/fstab

Add the following:

```
none    /mnt/ceph fuse.ceph   ceph.id=$accessTo,ceph.conf=/etc/ceph/ceph.conf,ceph.client_mountpoint=$volumePath,x-systemd.device-timeout=30,x-systemd.mount-timeout=30,noatime,_netdev,rw 0       2
```

Replace `$accessTo` with the arbitrary name you chose for the access rule in step 3 above and `$volumePath` with (    /volume/\_no-group/...) that is also in the share information that you created.

It should look something like this:

```
none    /mnt/ceph fuse.ceph   ceph.id=manilashare,ceph.conf=/etc/ceph/ceph.conf,ceph.client_mountpoint=/volumes/_nogroup/fe4f8ad4-2877-4e23-b5d3-46eb8476750b/ab404bac-9584-45f4-8a34-92dfc6    1fbb98,x-systemd.device-timeout=30,x-systemd.mount-timeout=30,noatime,_netdev,rw 0   2
```

iii.  /etc/ceph/ceph.client.`$accessTo`.keyring

Add the following, substituting the name you chose for the access rule and using the access key from that rule:

```
[client.$accessTo]
    key = $accessKey
```

Your file should look something like this :

```
[client.manilashare]
    key = AQAHfhZiwTf/NhAAT5ChE4tDXt3Nq1NyiURbMQ==
```
