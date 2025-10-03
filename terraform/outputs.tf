
output "bastion_pub_ip" {
  value = aws_instance.bastion.public_ip
}
