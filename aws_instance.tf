resource "aws_instance" "jenkins_ec2" {
  instance_type          = "t3.medium"
  count                  = "1"
  ami                    = data.aws_ami.server_ami.id
  key_name               = aws_key_pair.marshall.key_name
  vpc_security_group_ids = [aws_security_group.jen_sg.id]
  subnet_id              = aws_subnet.pub_subnet.id
  user_data              = file("userdata.tpl")

  root_block_device {
    volume_size = 10
  }
  tags = {
    Name = "jenkins-node-1"
  }
}

resource "aws_instance" "ansible" {
  instance_type          = "t3.medium"
  count                  = "1"
  ami                    = data.aws_ami.server_ami.id
  key_name               = aws_key_pair.marshall.key_name
  vpc_security_group_ids = [aws_security_group.jen_sg.id]
  subnet_id              = aws_subnet.pub_subnet.id
  user_data              = file("ansible.tpl")

  root_block_device {
    volume_size = 10
  }
  tags = {
    Name = "ansible-node-2"
  }
}

resource "aws_instance" "kubernetes_ec2" {
  instance_type          = "t3.medium"
  count                  = "1"
  ami                    = data.aws_ami.server_ami.id
  key_name               = aws_key_pair.marshall.key_name
  vpc_security_group_ids = [aws_security_group.jen_sg.id]
  subnet_id              = aws_subnet.pub_subnet.id
  user_data              = file("kubernetes.tpl")

  root_block_device {
    volume_size = 10
  }
  tags = {
    Name = "kubernetes-node-1"
  }
}