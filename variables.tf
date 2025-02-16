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

variable "ssh" {
  description = "Security Group rule for SSH on port 8080"
  type = object({
    name        = string
    description = string
    ingress     = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
    egress = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
  })
  default = {
    name        = "allow-ssh-8080"
    description = "Allow SSH on port 8080 from anywhere"
    ingress = [{
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }]
    egress = [{
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }]
  }
}

