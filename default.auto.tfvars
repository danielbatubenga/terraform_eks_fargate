aws_region = "us-east-1"
azs = [ "us-east-1a", "us-east-1b", "us-east-1c" ]
name = "eks-cluster"
tags = {
  env = "dev"
}
kubernetes_version = "1.21"
fargate_profile = [
    {
        name       = "default"
        namespace  = "default"
    },
]