variable "ami_id" {
    type = string
    default = "ami-0685f8dd865c8e389"
    description = "This is the Amazon AMI used"
  
}




variable "instance_type" {
    type = string
    default = "t2.micro"
    description = "This is the Amazon instance type used"
  
}