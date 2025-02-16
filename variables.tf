variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "VPC_CIDR"
  type = string
}

variable "public_subnet_cidr" {
  description = "public network cidr for my-vpc"
  type = list(string)
}

variable "private_subnet_cidr" {
   description = "private network cidr for my-vpc"
  type = list(string)
}

variable "AZ" {
  description = "AZ for subnets"
  type = list(string)
}

