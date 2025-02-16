resource "aws_key_pair" "my_key" {
  key_name   = "my-key"
  public_key = file("key-ssh/ssh-key.pub")  # Lấy public key từ local
}

resource "aws_instance" "first-instance" {
  ami = "ami-0e1bed4f06a3b463d"
  instance_type = "t2.micro"
  # availability_zone = var.AZ[1]
  subnet_id = aws_subnet.my-public-subnet[1].id
  vpc_security_group_ids = [aws_security_group.my-sg-for-ssh.id]
  key_name = aws_key_pair.my_key.key_name

  tags = {
    Name = "tuananh-bastion"
  }
}