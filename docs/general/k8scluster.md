# Building a Kubernetes Cluster

A k8s cluster is a collection of nodes running containers.  Each node is responsible for running containers that are on that specific node.

In this example we use the kubeadm tool to set up a cluster. Our cluster has 3 VMs – 1 control plane and 2 worker nodes.

####Installation

Create three virtual machines and run the installation commands (1-16) on all three.

1. Create configuration file for containerd:

        cat <<EOF | sudo tee /etc/modules-load.d/containerd.config
        overlay
        br_netfilter
        EOF

2. Load modules:

        sudo modprobe overlay
        sudo modprobe br_netfilter

3. Set networking configurations for K8s:

        cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
        net.bridge.bridge-nf-call-iptables = 1
        net.ipv4.ip_forward = 1
        net.bridge.bridge-nf-call-ip6tables = 1
        EOF

4. Apply new settings:

        sudo sysctl --system

5.  Install containerd:

        sudo apt-get update && sudo apt-get install -y containerd

6.	Create default configuration file for containerd:

        sudo mkdir -p /etc/containerd

7.	Generate default containerd configuration and save to the newly created default file:

        sudo containerd config default | sudo tee /etc/containerd/config.toml

8.	Restart containerd to ensure new configuration file usage:

        sudo systemctl restart containerd

9.	Verify that containerd is running.

        sudo systemctl status containerd

10.	Disable swap:

        sudo swapoff -a

11.	Install dependency packages:

        sudo apt-get update && sudo apt-get install -y apt-transport-https curl

12.	Download and add GPG key:

        curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

13.	Add Kubernetes to repository list:

        cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
        deb https://apt.kubernetes.io/ kubernetes-xenial main
        EOF

14.	Update package listings:

        sudo apt-get update


15.	Install Kubernetes packages

        sudo apt-get install -y kubelet=1.22.0-00 kubeadm=1.22.0-00 kubectl=1.22.0-00

16.	Turn off automatic updates:

        sudo apt-mark hold kubelet kubeadm kubectl

## Initialize the cluster


17. Before initializing the cluster make sure the Cgroup driver is `systemd` on all three VMs. <br>
    You can check that by running the following command:  `docker info | grep Cgroup `

    To change the Cgroup drive to systemd you can do the following:
    
        cat <<EOF | sudo tee /etc/docker/daemon.json
        {
          "exec-opts": ["native.cgroupdriver=systemd"],
          "log-driver": "json-file",
          "log-opts": {
            "max-size": "100m"
          },
          "storage-driver": "overlay2"
        }
        EOF

18. You will need to restart Docker and reset kubeadm for the change in step 17. to take effect.

        sudo systemctl daemon-reload
        sudo systemctl restart docker
        sudo kubeadm reset


19.	Initialize the Kubernetes cluster on the control plane node using kubeadm:<br>

        sudo kubeadm init --pod-network-cidr 192.168.0.0/16 --kubernetes-version 1.22.0

20. Set kubectl access on the control plane :

        mkdir -p $HOME/.kube
        sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
        sudo chown $(id -u):$(id -g) $HOME/.kube/config

21. On the Control Plane Node, install Calico Networking:

        kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml

22. Test access to cluster:

        kubectl get nodes

## Join worker nodes to the cluster

23. On the *Control Plane Node*, create the token and copy the kubeadm join command. <br> (<span style="color:darkred">***Note:***</span> The join command can also be found in the output from kubeadm init command):

        kubeadm token create --print-join-command

24. On the *Worker Nodes*, paste the kubeadm join command to join the cluster. Use sudo to run it as root:

        sudo kubeadm join ...

25. On the *Control Plane Node*, view cluster status. <br> (<span style="color:darkred">***Note:***</span> You may have to wait a few moments to allow all nodes to become ready):

        kubectl get nodes

## Clean up

26. On the *Control Plabe Node*, delete ia resource using kubectl:

        kubectl delete node <node name> 


<span style="color:darkred">***Note:***</span> 

Before using the cluster confirm that all pods in the kube-system are running: 

        kubectl get pods -n kube-system -o wide

This command will give you a list of pods in the kube-system namespace, the status of the pod, the node it is running on. 
If the status of a pod is not `Running`, you can check the logs for error messages: 

        kubectl logs -n kube-system {name_of_your_pod}  


