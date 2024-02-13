# Share data between JupyterHub users with Manila shares

In the [standard deployment of JupyterHub on top of Kubernetes on Jetstream 2](https://www.zonca.dev/posts/2022-03-31-jetstream2_jupyterhub){target=_blank}, each user has access to their own home folder, but there is no built-in way to share data between users.

One option is to [install a NFS server as a service in Kubernetes](https://www.zonca.dev/posts/2020-07-10-nfs-server-kubernetes-jetstream){target=_blank}.
However, Jetstream offers a managed service, named Manila, that offers the sharing capability out-of-the-box.

Therefore we can lower the maintenance burden by creating a shared volume inside Manila and then mount it on any Kubernetes or JupyterHub pod, so that users can access shared data read-only or read-write.

## Create a Share in Manila

Create a share in Horizon [following the instructions in the Jetstream documentation](../ui/horizon/manila.md){target=_blank}:

  * for access to choose "$USER-manila-share"
  * note down "Path" and "Access Key"

## Test in a Pod

First we want to test the connection with a pod, which is also useful to perform administrative tasks on the volume.

You can find all the necessary files [in this Github repository](https://github.com/zonca/jupyterhub-deploy-kubernetes-jetstream/tree/master/manila){target=_blank}.

Copy the access key into `ceph-secret.yml`, then create the secret with:

    kubectl create -f ceph-secret.yml

Then split the "Path" string you copied from Horizon into the different servers and the path and copy them to `ceph-pod.yml` and:

    kubectl create -f ceph-pod.yml

Access the shared volume with:

    kubectl exec --stdin -n jhub --tty ceph -- /bin/bash
    cd /mnt/cephfs

This container executes as `root`, so you should have write access to the share, instead, the JupyterHub users use the `jovyan` user, so we need to create a folder owned by `jovyan` to give them write access, all other folders will be read-only:

    mkdir readonly
    mkdir readwrite
    chown 1000:100 readwrite

so we should have:

```
root@cephfs-pod:/mnt/cephfs# ls -la
total 6
drwxr-xr-x 4  119   126    0 Dec  1 00:48 .
drwxr-xr-x 1 root root  4096 Nov 30 23:50 ..
drwxr-xr-x 2 root root     0 Dec  1 00:04 readonly
drwxr-xr-x 2 1000 users    0 Dec  1 00:07 readwrite
```

## Configure JupyterHub

We can finally configure JupyterHub to mount this volume, if you have followed the JupyterHub deployment tutorial, you should have your `install_jhub.sh` script, edit it to also add an additional configuration file:

```
RELEASE=jhub
NAMESPACE=jhub

helm upgrade --install $RELEASE jupyterhub/jupyterhub \
      --namespace $NAMESPACE  \
      --create-namespace \
      --version 1.2.0 \
      --debug \
      --values config_standard_storage.yaml --values secrets.yaml \
      --values manila/jupyterhub_manila.yaml
```

`manila/jupyterhub_manila.yaml` contains the same configuration of `ceph-pod.yml`, so you can copy-paste from there.

Now you should be able to access the shared folders from a JupyterHub single user session:

```
jovyan@jupyter-zonca:~$ cd /share
jovyan@jupyter-zonca:/share$ ls -lah
total 5.5K
drwxr-xr-x 4    119   126    0 Dec  1 00:48 .
drwxr-xr-x 1 root   root  4.0K Nov 30 23:48 ..
drwxr-xr-x 2 root   root     0 Dec  1 00:04 readonly
drwxr-xr-x 2 jovyan users    0 Dec  1 00:07 readwrite
jovyan@jupyter-zonca:/share$ touch readwrite/myfile
jovyan@jupyter-zonca:/share$ touch readonly/myfile
touch: cannot touch 'readonly/myfile': Permission denied
```
