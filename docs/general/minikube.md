# Minikube

Minikube allows you to run a Kubernetes cluster locally.
 
#### Installation

1. Install Minikube on your Virtual Machine:
 
        curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
        sudo install minikube-linux-amd64 /usr/local/bin/minikube
        sudo minikube config set vm-driver none
       
   Note: If you have VirtualBox installed, you can specify vm-driver=VirtualBox

2. Install kubectl:

        curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
        chmod +x kubectl
        sudo mv ./kubectl /usr/local/bin/kubectl

3. Start Minikube:

        minikube start

4. You can check your kubectl installation running the following command:
        kubectl get pods --all-namespaces
       
   This should list all the kube-system pods currently running on the machine. 

5. Create a Deployment 

        kubectl create deployment --image nginx my-nginx
        kubectl expose deployment my-nginx --port=80 --type=NodePort
        kubectl get svc



7. Start Dashboard
        
       To view your minikube dashboard, run the following command. 

       minikube dashboard -- url &

       This might throw an error depending on what's installed on your machine. To access your dashboard you need to run Kubeproxy. 


8.  Kubeproxy
       kubectl proxy --address=0.0.0.0 --accept-hosts='.*'


9. View Minikube Dashboard
      
      To view your minikube dashboard from your web browser, run the following command: 
        
        http://{host_ip}:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/
         (Replace host_ip with the ip address of your VM) 

10. Delete Cluster

       minikube delete

   
