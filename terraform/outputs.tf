
output "bastion_pub_ip" {
  value = aws_instance.bastion.public_ip
}

output "app_pub_ip" {
  value = aws_instance.application.public_ip
}