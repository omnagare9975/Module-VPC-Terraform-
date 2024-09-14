variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/24"
}

variable "vpc_name" {
  description = "Name for the VPC"
  type        = string
  default     = "Terraform-VPC-CST"
}

variable "igw_name" {
  description = "Name for the Internet Gateway"
  type        = string
  default     = "IGW-For-Terraform"
}

variable "subnet_cidr" {
  description = "The CIDR block for the Subnet"
  type        = string
  default     = "10.0.0.0/26"
}

variable "availability_zone" {
  description = "Availability Zone for the Subnet"
  type        = string
  default     = "ap-south-1a"
}

variable "subnet_name" {
  description = "Name for the Subnet"
  type        = string
  default     = "my-new-subnet"
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  default = "ami-0522ab6e1ddcc7055"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key pair name for EC2 instance"
  type        = string
  default = "RDS-OM"
}

variable "ec2_name" {
  description = "Name for the EC2 instance"
  type        = string
  default     = "my-EC2"
}
