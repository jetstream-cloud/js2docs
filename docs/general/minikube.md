# Minikube


#### Installation

1. Install Minikube on your Virtual Machine:
 
        curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
        sudo install minikube-linux-amd64 /usr/local/bin/minikube
        sudo minikube config set vm-driver none
        chown -R $USER $HOME/.kube $HOME/.minikube


2. Install kubectl:

        curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
        chmod +x kubectl
        sudo mv ./kubectl /usr/local/bin/kubectl


   You can check your kubectl installation running the following command:

        kubectl get pods --all-namespaces


3. Start Minikube:

        minikube start

4. Create a Deployment 

        kubectl create deployment --image nginx my-nginx
        kubectl expose deployment my-nginx --port=80 --type=NodePort
        kubectl get svc

5. Kubeproxy

        kubectl proxy --address=0.0.0.0 --accept-hosts='.*'


6. Start Dashboard

        minikube dashboard -- url &

 7. View Dashboard

        http://{host_ip}:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/
