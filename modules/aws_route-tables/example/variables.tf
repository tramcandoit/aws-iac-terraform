variable "region" {
  type        = string
  default     = "ap-southeast-1"
  description = "Region of VPC"
}

variable "vpc_ids" {
  type        = string
  description = "ID of VPC that Route Table will be created in"
  default     = "vpc-0eb364f47c3e9aaaa"
}

variable "igw_ids" {
  type        = string
  description = "ID of Internet Gateway that Route Table will be created in"
  default     = "igw-07cdc8b755e042419"
}

variable "nat-gateway_ids" {
  type        = string
  description = "ID of NAT Gateway that Route Table will be created in"
  default     = "nat-0b6795dffde10ba02"
}

variable "public_subnet_ids" {
  type        = string
  description = "ID of Public Subnet that Route Table will be created in"
  default     = "subnet-02a75f275ae6a6b39"
}

variable "private_subnet_ids" {
  type        = string
  description = "ID of Private Sutẻbnet that Route Table will be created in"
  default     = "subnet-06c132c062e339b3d"
}