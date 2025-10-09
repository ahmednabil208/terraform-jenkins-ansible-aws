output "vpc_id" {
  value = aws_vpc.myvpc.id
}

output "vpc_arn" {
  value = aws_vpc.myvpc.arn
}


output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "public_subnet2_id" {
  value = aws_subnet.public2_subnet.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}


output "private_subnet2_id" {
  value = aws_subnet.private_subnet2.id
}

