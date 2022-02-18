# Managing your application with Kubernetes 

To manage applications with Kubernetes we use the `apply` command. This command requires a file or directory of files. When run, the apply command makes the state of the Kubernetes cluster match the state defined in the file/s. 

Using the Kubernetes CLI, (Kubectl), we can create objects such as Pods, Deployments. etc. by providing a yaml file for that object. 
 

### Pods

A Pod represents a single instance of an app running in the cluster. 

Here's an example of a yaml file that defines a pod named, simple-pod.yaml 
The kind field describes the type of object you want to create. 
The pod spec must contain at least one container. Image specifies which image will be run in the pod. 
Finally, we list the port to expose from the container. 

yaml manifest:

       apiVersion: v1
       kind: Pod
       metadata:
         name: nginx-deployment
         label:
         app: nginx  
       spec:
         containers:
         - name: nginx
           image: nginx:1.14.2
           ports:
           - containerPort: 80

To create the pod defined in the yaml file above, run the following command. 

    kubectl apply -f simple-pod.yaml 


command line:  

    kubectl run nginx-deployment --image=nginx --port=80

### ReplicaSet

ReplicaSet adds or deletes pods as needed. 
Creating replicas of a pod scales an application horizontally. Replicas are usually created as part of a deployment. 
Here's a sample yaml file for creating 2 replicas, to create a ReplicaSet without a deployment.  

       apiVersion: apps/v1
       kind: ReplicaSet
       metadata:
         name: nginx-replicaset
       spec: 
         replicas: 2
         selector:
           matchLabels:
            app: nginx
       spec: 
         containers:
         - name: nginx
           image: nginx:1.14.2
           ports:
           -containerPort: 80

command line: 

    kubectl scale --replicas=2 deployment nginx-deployment


### Deployment

Deployment is an object that can provide updates to both pods and ReplicaSets. 
Deployment object allows you to do rolling updates of a pod, ReplicaSet object does not. A rolling update scales up the new version to the appropriate number of replicas and scales down the old version to zero. 

yaml manifest: 

       apiVersion: apps/v1
       kind: Deployment
       metadata:
         name: nginx-deployment
       spec: 
         replicas: 3
         selector:
           matchLabels:
            app: nginx
       spec: 
         containers:
         - name: nginx
           image: nginx:1.14.2
           ports:
           -containerPort: 80

command line: 

    kubectl create deployment nginx-deployment --image=nginx


### Service

Service enables network access from either within the cluster or between external processes. 

       kind: Service
       metadata:
         name: nginx-ingress
       spec:
         type: NodePort
         ports:
         - port: 80
           targetPort: 80
           protocol: TCP
           name: http
         - port: 443
           targetPort: 443
           protocol: TCP
           name: https
         selector:
           app: nginx


command line: 

       kubectl create service nodeport nginx-deployment --tcp=80:80


### Autoscaling

A Horizontal Pod Autoscaler (HPA) allows you to scale up or down depending on traffic. 
This can be configured by specifying the CPU or memory states. 
The master node periodically checks to see if the desired state is met and scales up or down as needed.  

One way to do this is to enable autoscaling in a yaml file: 

       apiVersion: apps/v1
       kind: Deployment
       metadata:
         name: nginx-deployment
         namespace: default
       spec:
         maxReplicas: 10
         minReplicas: 5
         scaleTargetRef: 
           apiVersion: apps/v1
           kind: Deployment
           name: nginx-deployment
          targetCPUUtilizationPercentage: 10
       ...
       ...
         
command line: 
        
       kubectl autoscale deploy nginx-deployment --min=5 --max=10 --cpu-percent=50

