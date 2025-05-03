provider "aws" {
  region = "us-east-1"  # Cambia la regione AWS a seconda delle tue preferenze (es. "us-east-1", "eu-central-1", etc.)
}

# VPC
resource "aws_vpc" "main" {
  cidr_block           = "10.1.0.0/16"  # Cambiato il blocco CIDR (es. "10.1.0.0/16")
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "custom-vpc"
  }
}

# Public Subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.1.1.0/24"  # Cambiato il CIDR della subnet pubblica
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-custom"
  }
}

# Private Subnet
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.1.2.0/24"  # Cambiato il CIDR della subnet privata

  tags = {
    Name = "private-subnet-custom"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "custom-igw"
  }
}

# Route Table for Public Subnet
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-route-table-custom"
  }
}

# Route Table association for public subnet
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# Security Group 
resource "aws_security_group" "custom-sg" {
  vpc_id = aws_vpc.main.id
  name   = "custom-sg" 

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["198.51.100.0/24"]  # Permessi SSH solo per una IP range specifica (modificato l'IP di origine)
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Permessi HTTP per tutti
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Permessi HTTPS per tutti
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Permessi per porta 3000
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Permessi di uscita per tutte le destinazioni
  }

  tags = {
    Name = "custom-sg"
  }
}

# EC2 Instance
resource "aws_instance" "my_instance" {
  ami                         = "ami-12345678"  # Sostituisci con un ID AMI corretto
  instance_type               = "t3.micro"  # Tipo di istanza modificato
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.custom-sg.id]
  associate_public_ip_address = true
  key_name                    = "my-key-pair"  # Modificato con un nome di key pair personalizzato

  user_data = <<-EOF
              #!/bin/bash
              # Modifica il comando per adattarsi alla tua configurazione
              bash /home/ubuntu/setup_nginx.sh
              EOF

  tags = {
    Name = "custom-instance"
  }
}
