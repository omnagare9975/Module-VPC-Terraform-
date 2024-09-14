resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.igw_name
  }
}

resource "aws_route_table" "route1" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Route-table"
  }
}

resource "aws_subnet" "subnet" {
   vpc_id = aws_vpc.main.id
   cidr_block = var.subnet_cidr
   availability_zone = var.availability_zone
   map_public_ip_on_launch = true
   
   tags = {
     Name = var.subnet_name
   }
}

resource "aws_security_group" "name" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_route_table_association" "association" {
  route_table_id = aws_route_table.route1.id
  subnet_id      = aws_subnet.subnet.id
}

resource "aws_instance" "mainec2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.subnet.id
  vpc_security_group_ids = [aws_security_group.name.id]

  user_data = <<-EOF
    sudo apt-get update -y
    sudo apt-get install nginx -y
    sudo systemctl enable nginx
    sudo systemctl start nginx
    EOF

  root_block_device {
    volume_size = 8
    volume_type = "gp2"
  }

  tags = {
    Name = var.ec2_name
  }
}
