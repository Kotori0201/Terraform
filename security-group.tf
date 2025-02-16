resource "aws_security_group" "my-sg-for-ssh" {
  vpc_id = aws_vpc.my-vpc.id
  name        = var.ssh.name
  description = var.ssh.description

  dynamic "ingress" {
    for_each = var.ssh.ingress
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.ssh.egress
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = {
    Name = var.ssh.name
  }
}
