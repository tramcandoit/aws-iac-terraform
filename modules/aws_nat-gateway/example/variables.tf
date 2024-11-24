variable "region" {
  type        = string
  default     = "ap-southeast-1"
  description = "Region of VPC"
}

variable "subnet_ids" {
  type        = string
  description = "ID of subnet that NAT Gateway will be created in"
  default     = "subnet-02a75f275ae6a6b39"
}