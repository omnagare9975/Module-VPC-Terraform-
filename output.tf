output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_id" {
  value = aws_subnet.subnet.id
}

output "ec2_instance_id" {
  value = aws_instance.mainec2.id
}

output "ec2_instance_public_ip" {
  value = aws_instance.mainec2.public_ip
}
