# Managing your application with Kubernetes 

Using the Kubernetes CLI, (Kubectl), we can create objects such as Pods, Deployments. etc. by providing a yaml file for that object. 
 
<span style="color:darkred">***This page is under construction***</span>


## PODS

A Pod represents a single instance of an app running in the cluster. 

Here's an example of a yaml file that defines a pod named, simple-pod.yaml 
The kind field describes the type of object you want to create. 
The pod spec must contain at least one container. Image specifies which image will be run in the pod. 
Finally, we list the port to expose from the container. 

       apiVersion: v1
       kind: Pod
       metadata:
         name: nginx
       spec:
         containers:
         - name: nginx
           image: nginx:1.14.2
           ports:
           - containerPort: 80

To create the pod defined in the yaml file above, run the following command. 

    kubectl apply -f simple-pod.yaml 

## REPLICASET
Creating replicas of a pod scales an application horizontally.

## DEPLOYMENT
## SCALING


## VOLUME 
