variable "region" {
  type        = string
  default     = "ap-southeast-1"
  description = "Region of EC2"
}

variable "instances_configuration" {
  type = list(object({
    count         = number
    ami           = string
    instance_type = string
    root_block_device = object({
      volume_size = number
      volume_type = string
    })
    tags                   = map(string)
    vpc_security_group_ids = list(string)
    subnet_id              = string
    user_data_file         = optional(string, null) #path to user_data file
    key_name               = string
    associate_elastic_ip   = bool
    iam_instance_profile   = optional(string, null) # instance in private subnet does not need public IP
  }))

  default = [{
    count         = 1
    ami           = "ami-03fa85deedfcac80b" # ubuntu 22.04
    instance_type = "t2.micro"
    root_block_device = {
      volume_size = 8
      volume_type = "gp2"
    }
    tags = {
      Name = "public-instance"
    }
    vpc_security_group_ids = ["sg-0d553911f799396c4"]   # public ssh sg
    subnet_id              = "subnet-041510e8909031abd" # public subnet
    user_data_file         = "user-data.sh"
    key_name               = "ssh_keypair"
    associate_elastic_ip   = true
    iam_instance_profile   = "ec2-role-instance-profile"
    },
    {
      count         = 1
      ami           = "ami-03fa85deedfcac80b" # ubuntu 22.04
      instance_type = "t2.micro"
      root_block_device = {
        volume_size = 8
        volume_type = "gp2"
      }
      tags = {
        Name = "private-instance"
      }
      vpc_security_group_ids = ["sg-08705e0fc156d470b"]   # private ssh sg
      subnet_id              = "subnet-03b33f082859af882" # private subnet
      user_data_file         = null
      key_name               = "ssh_keypair"
      associate_elastic_ip   = false
      iam_instance_profile   = null
  }]
}