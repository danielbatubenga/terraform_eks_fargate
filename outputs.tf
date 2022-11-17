output "eks" {
  description = "The generate AWS EKS cluster"
  value       = module.eks.cluster
}

output "role" {
  description = "The generate role of the EKS node group"
  value       = module.eks.role
}

output "kubeconfig" {
  description = "Bash script to update the kubeconfig file for the EKS cluster"
  value       = module.eks.kubeconfig
}

output "features" {
  description = "Features configurations of the AWS EKS cluster"
  value       = module.eks.features
}