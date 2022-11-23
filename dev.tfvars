aws_region = "us-east-1"
azs        = ["us-east-1a", "us-east-1c", "us-east-1d"]
name       = "eks-fargate-dev"
tags = {
  env  = "dev"
  test = "env-dev"
}
kubernetes_version = "1.21"
fargate_profiles = [
  {
    name      = "default"
    namespace = "default"
  },
]
