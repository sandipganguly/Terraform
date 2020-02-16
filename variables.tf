variable Base_Tag {
  type = map(string)
  default = {
    ManagedBy = "Terraform"
    Terraform = "True"
  }
}

variable region {
  type = string
  default ="us-east-2"
}
variable vpc_cidr {
  type = string
#  default = "10.2.0.0/16"
}

variable public_subnet {
  type = map
}   
  
variable ami {
  type = map
  default = {
     us-east-1 = "ami-0a887e401f7654935"
     us-east-2 = "ami-0e38b48473ea57778"
  }
}
  
