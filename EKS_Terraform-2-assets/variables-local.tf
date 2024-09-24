variable "aws-region" {
  default = "eu-north-1"
}

variable "env" {
  default = "dev"
}

variable "cluster-name" {
  default = "eks-cluster"
}

variable "vpc-cidr-block" {
  default = "10.16.0.0/16"
}

variable "vpc-name" {
  default = "vpc"
}

variable "igw-name" {
  default = "igw"
}

variable "pub-subnet-count" {
  default = 3
}

variable "pub-cidr-block" {
  type = list(string)
  default = ["10.16.0.0/20", "10.16.16.0/20", "10.16.32.0/20"]
}

variable "pub-availability-zone" {
  type = list(string)
  default = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
}

variable "pub-sub-name" {
  default = "subnet-public"
}

variable "pri-subnet-count" {
  default = 3
}

variable "pri-cidr-block" {
  type = list(string)
  default = ["10.16.128.0/20", "10.16.144.0/20", "10.16.160.0/20"]
}

variable "pri-availability-zone" {
  type = list(string)
  default = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
}

variable "pri-sub-name" {
  default = "subnet-private"
}

variable "public-rt-name" {
  default = "public-route-table"
}

variable "private-rt-name" {
  default = "private-route-table"
}

variable "eip-name" {
  default = "elasticip-ngw"
}

variable "ngw-name" {
  default = "ngw"
}

variable "eks-sg" {
  default = "eks-sg"
}

# EKS
variable "is-eks-cluster-enabled" {
  default = true
}

variable "cluster-version" {
  default = "1.29"
}

variable "endpoint-private-access" {
  default = true
}

variable "endpoint-public-access" {
  default = false
}

variable "ondemand_instance_types" {
  default = ["t3.medium"]
}

variable "spot_instance_types" {
  default = ["c5.large", "c5.xlarge", "m5.large", "m5.xlarge", "c5.large", "m5.large", "t3.large", "t3.xlarge", "t3.medium"]
}

variable "desired_capacity_on_demand" {
  default = 1
}

variable "min_capacity_on_demand" {
  default = 1
}

variable "max_capacity_on_demand" {
  default = 5
}

variable "desired_capacity_spot" {
  default = 1
}

variable "min_capacity_spot" {
  default = 1
}

variable "max_capacity_spot" {
  default = 10
}

variable "addons" {
  type = list(object({
    name    = string
    version = string
  }))
  default = [
    {
      name    = "vpc-cni"
      version = "v1.18.1-eksbuild.1"
    },
    {
      name    = "coredns"
      version = "v1.11.1-eksbuild.9"
    },
    {
      name    = "kube-proxy"
      version = "v1.29.3-eksbuild.2"
    },
    {
      name    = "aws-ebs-csi-driver"
      version = "v1.30.0-eksbuild.1"
    }
  ]
}
