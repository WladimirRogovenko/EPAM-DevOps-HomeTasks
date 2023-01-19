# ${server_web_port} - convert link to STR for BASH script example
variable "server_web_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}

variable "server_ssh_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 22
}

output "node1_public_ip" {
  value       = aws_instance.jenkins-node1.public_ip
  description = "The public IP address of the jenkins-node1 server"
  sensitive   = false #if TRUE - TF didn't write in log after APPLY. For security ))
}

data "aws_vpc" "default-1" {
  default = true #its filter
}                #for read this var: data.aws_vpc.default-1.id

data "aws_subnets" "default" {
  #name = data.aws_vpc.default-1.id  #filter
}

#data "aws_subnet_ids" "default" {    #OLD resurs, make Warning!!!!!
#  vpc_id = data.aws_vpc.default-1.id #filter
#}

output "test_var" { #var for my tests
  #value=data.aws_subnets.default.ids #return list of subnets in current region
  value = data.aws_vpc.default-1.id #return current VPC
  #value = data.aws_vpc.default-1 #return all parametrs of VPC
}
