# Persistent Volumes in Kubernetes

Container filesystems are ephemeral. One way to persist data beyond the lifetime of a pod is by using volumes. PersistentVolume is storage external to the Container but within the same Pod spec.

Creating persistent storage requires the following definitions:

 -  StorageClass, 
 -  PersistentVolume, 
 -  PersistentVolumeClaim, and
 -  Pod that uses the PersistentVolumeClaim for storage.

Here are some sample definition files. 

### StorageClass:

        apiVersion: storage.k8s.io/v1
        kind: StorageClass
        metadata:
          name: localdisk
        provisioner: kubernetes.io/no-provisioner


### PersistentVolume

        apiVersion: v1
        kind: PersistentVolume
        metadata:
          name: alpine-pv
          namespace: default
        spec:
          storageClassName: localdisk
          capacity:
            storage: 1Gi
          accessModes:
            - ReadWriteOnce
          hostPath:
            path: /var/output

###  PersistentVolumeClaim

        apiVersion: v1
        kind: PersistentVolumeClaim
        metadata:
          name: alpine-pv-claim
        spec:
          storageClassName: localdisk
          accessModes:
            - ReadWriteOnce
          resources:
            requests:
              storage: 100Mi


### Pod

        apiVersion: v1
        kind: Pod
        metadata:
          name: alpine
          namespace: default
        spec:
          volumes:
            - name: alpine-volume
              persistentVolumeClaim:
                 claimName: alpine-pv-claim
          containers:
            - image: alpine:3.2
              command: ['sh', '-c', 'while true; do echo This is a test! > /output/trial_run.txt; sleep 20; done']
              imagePullPolicy: IfNotPresent
              name: alpine
              volumeMounts:
                 - name: alpine-volume
                   mountPath: /output 

The steps to create and use volumes are below:

1. On the Control Plane, create the StorageClass, PersistentVolume, PersistentVolumeClaim, and Pod with the `kubectl create` command. 

2. Check if your pod is running and which worker node it is running on: 

        kubectl get pods -o wide 

   The `-o wide` above list the node the pod is running on. 

3. Log into the worker node and verify that `/var/output/trial_run.txt` exists and is populated. 

4. If you delete and recreate the pod, the volume will automatically bind to the new pod with the `trial_run.txt` file.     
