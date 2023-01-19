resource "aws_instance" "jenkins-node1" {
  ami           = "ami-0f15e0a4c8d3ee5fe"
  instance_type = "t2.micro"
  key_name = "shkeeper_aws_ec2"
  #security_groups = [ "sg-05cfacc0d9b1128d1" ]
  vpc_security_group_ids = [aws_security_group.instance8080_22.id]
  subnet_id = "subnet-013fce197ddcf2235"

  tags = {
    Name    = "jenkins-node1"
    Projecr = "homework"
  }
}

resource "aws_security_group" "instance8080_22" {
name = "tf-instance-1"
ingress {
from_port = var.server_web_port
to_port = var.server_web_port
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
ingress {
from_port = var.server_ssh_port
to_port = var.server_ssh_port
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
}