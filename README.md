# repute-assignment

STEP-1

I have Craeted one vpc with  Two subnets having internet gate way and round table 

Step-2

I have created Eks cluster with 2 Nodes in us-east Zone with installing commands in Null resource
      curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
      sudo apt-get install unzip
      unzip awscliv2.zip
      sudo ./aws/install
      curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
      sudo chmod +x kubectl
      sudo mv kubectl /usr/local/bin/kubectl

     curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
     sudo mv /tmp/eksctl /usr/local/bin
     eksctl version

STEP-3 

Create an IAM Role and attache it to EC2 instance      
   IAM user should have access to   
   IAM   
   EC2   
   VPC    
   CloudFormation

STEP-4 
Install terraform using Terraform documentation By using below commands.
   wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
   echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
   sudo apt update && sudo apt install terraform

STEP-5
Check the cluster wheather nodes are created or not by using command 
  Kubectl get nodes

if you get any error we can update kubeconfig by using below command
 aws eks update-kubeconfig --region us-east-1 --name eks-cluster

STEP-6
Created nginx deployment, service and autoscale yaml files for deployment purpose once the application is deployed we can access the application by Dns name using load balancer.

I have installed some packages for CRDS and Autoscaling 

    git clone https://github.com/kubernetes/autoscaler.git
    cd autoscaler/vertical-pod-autoscaler/deploy/manifests

Installing metrics 
    kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

