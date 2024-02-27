# Kubernetes


Kubernetes (K8s) is an open-source system for automating deployment, scaling, and management of containerized applications.

More information on Kubernetes here: [Kubernetes](https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/){target=\_blank}

### Kubernetes topics

- [Building a Kubernetes Cluster](./k8scluster.md)
- [Deploy a Kubernetes Cluster with Kubespray](./k8skubespray.md)
- [Managing applications with Kubernetes](./k8smanage.md)
- [Persistent Volumes in Kubernetes](./k8svolumes.md)
- [Share data using Manila](./k8smanila.md)
- [Minikube](./minikube.md)
- [Deploy BinderHub on Kubernetes](./k8sbinderhub.md)
- [Deploy Kubernetes and JupyterHub with GPU support](./k8sgpu.md)
- [Using Cacao on Jetstream2 for Kubernetes](../ui/cacao/intro.md)

### Third Party Kubernetes topics

- [Deploy JupyterHub](https://www.zonca.dev/posts/2022-03-31-jetstream2_jupyterhub){target=\_blank}
- [Update Openstack credentials in Kubernetes](https://www.zonca.dev/posts/2023-03-23-update-openstack-credentials-kubernetes){target=\_blank}, useful if the Application Credential generated for Kubernetes has expired.
- [Quickly scaling a Kubernetes cluster on Jetstream using shelving](https://www.zonca.dev/posts/2024-02-02-soft-scaling-kubernetes-jetstream){target=\_blank}

---
Some K8s basics :

1. A ***Pod*** is the smallest deployable unit of Kubernetes. A Pod can contain one or more containers on a single IP address (internal). Containers within a pod can communicate with each other. Pods are run on Nodes.
2. A ***Node*** is a physical or virtual machine and it’s components include kubelet, kube-proxy and Container run-time.
    * ***Kubelet*** is the Node agent that manages containers created by Kubernetes.
    * ***Kube-proxy*** is used by Service to run a network proxy on each Node.
    * ***Container runtime*** is the software responsible for running containers. Ex: Docker, containerd, and CRI-O.
3. ***Service*** allows the use of a stable network address for an application, including a persistent ip address and a local DNS entry within the cluster. Service also acts as a load-balancer across all pods allowing the addition removal of pods from a deployment.
4. ***ReplicaSet*** is a convenient way to build multiple pods at once.
5. ***Deployment*** provides declarative updates for Pods and ReplicaSets (rolling updates)
6. ***Control Pane*** is a node that controls/manages worker nodes. The components of the Control Pane are the API Server, the cluster store, the controller manager,  and the scheduler.
    * ***API server*** – All communication between the various Kubernetes components must go through the API server
    * ***Cluster Store***  or ***etcd*** – Persistently stores the cluster’s configuration, state, and metadata.
    * The ***Controller Manager*** runs controller processes that monitor and respond to controller events. Some examples of control loops include; node controller, job controller, end point controller, and replication controller.
    * The ***Scheduler*** assigns pods to nodes.
