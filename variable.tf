variable "env" {
    description = "define the environment"
    type = string
    default = "testing"
}

variable "ami" {
    description = "define the amazon machine image"
    type = string
    default = "ami-084568db4383264d4"
}

variable "instance_type" {
    description = "define the instance type"
    type = string
    default = "t2.micro"
}

variable "volume_size" {
    description = "define the root volume for  your instance "
    type = number
    default = 9
}

variable "volume_type" {
    description = "define the type of volume for your instance"
    type = string
    default = "gp3"
}