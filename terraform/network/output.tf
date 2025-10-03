output "vpc_id" {
  value = aws_vpc.myvpc.id
}

output "vpc_arn" {
  value = aws_vpc.myvpc.arn
}


output "public_subnet" {
  value = aws_subnet.public_subnet.id
}

output "private_subnet" {
  value = aws_subnet.private_subnet.id
}


output "public_sg" {
  value = aws_security_group.public_sg.id
}

output "private_sg" {
  value = aws_security_group.private_sg.id
}