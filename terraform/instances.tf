# bastion ec2
resource "aws_instance" "bastion" {
  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.public_sg.id]
  subnet_id                   = module.network.public_subnet_id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.ssh_key.key_name

  tags = {
    Name = "bastion"
  }

  root_block_device {
    delete_on_termination = true
  }


  provisioner "local-exec" {
    command = "echo ${aws_instance.bastion.public_ip}"
  }


}



# ====================================================================

# application ec2
resource "aws_instance" "application" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  subnet_id              = module.network.private_subnet_id
  key_name               = aws_key_pair.ssh_key.key_name

  tags = {
    Name = "application"
  }

  root_block_device {
    delete_on_termination = true
  }

  provisioner "local-exec" {
    command = "echo 'EC2 Instance ${self.id} has been created at ${timestamp()}' >> deployment.log"

  }
}
