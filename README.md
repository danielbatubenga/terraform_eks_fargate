# Terraform for Amazon EKS on Fargate

## AWS Fargate
AWS Fargate is a technology that provides on-demand, right-sized compute capacity for containers. With AWS Fargate, you no longer have to provision, configure, or scale groups of virtual machines to run containers. This removes the need to choose server types, decide when to scale your node groups, or optimize cluster packing. You can control which pods start on Fargate and how they run with Fargate profiles. Each pod running on Fargate has its own isolation boundary and does not share the underlying kernel, CPU resources, memory resources, or elastic network interface with another pod. For more information, please refer [this](https://docs.aws.amazon.com/eks/latest/userguide/fargate.html).

## Download this example
Download this example on your computer

```
git clone https://github.com/danielbatubenga/terraform_eks_fargate.git
cd terraform_eks_fargate
```
## Setup
[This](https://github.com/danielbatubenga/terraform_eks_fargate/blob/dev/main.tf) ismthe example of terraform configuration.

Run terraform

```
terraform init
terraform apply
```
Also you can use the `-var-file` option for customized paramters when you run the terraform plan/apply command.
```
terraform plan -var-file dev.tfvars
terraform apply -var-file dev.tfvars
```
Run terraform. After provisioning of EKS cluster, you can deploy the example using kubectl.
```
kubectl apply -f k8s/hello-kubernetes.yaml
```
A few minutes later you can see the fargate nodes are up. And you can try to access the service via port forwarding when all pods are ready and runnig. If everything looks fine, open the `localhost:8080` url on your web browser.
```
kubectl get node
```
```
NAME                 STATUS   ROLES    AGE     VERSION
fargate-10.0.2.59    Ready    <none>   109s    v1.17.9-eks-a84824
fargate-10.0.3.171   Ready    <none>   2m31s   v1.17.9-eks-a84824
fargate-10.0.3.80    Ready    <none>   2m49s   v1.17.9-eks-a84824
```
```
kubectl port-forward svc/hello-kubernetes 8080:80
```
To clean up all resources or hello-kubernetes application from cluster, run kubectl:
```
kubectl delete -f k8s/hello-kubernetes.yaml
```
## Clean up
Run terraform:
```
terraform destroy
```
Don't forget you have to use the `-var-file` option when you run terraform destroy command to delete the aws resources created with extra variable files.
```
terraform destroy -var-file dev.tfvars
```

## NOTE

Currently you need to configure kubernetes login manually (I'm solving it)