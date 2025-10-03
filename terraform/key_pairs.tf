# RSA key of size 4096 bits
# This creates both a public and private key in Terraform.
resource "tls_private_key" "mykey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# EC2 will use this key pair when you launch instances.
resource "aws_key_pair" "ssh_key" {
  key_name   = "deployer-key"
  public_key = tls_private_key.mykey.public_key_openssh
}


