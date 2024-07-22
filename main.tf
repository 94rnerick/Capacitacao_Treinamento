provider "aws" {
  region     = "us-east-1"  # Especifica a região da AWS
  access_key = var.aws_access_key  # Tipo de variavel definido no variables.tf e informado em terraform.tfvars
  secret_key = var.aws_secret_key  # Tipo de variavel definido no variables.tf e informado em terraform.tfvars
}

resource "aws_instance" "wordpress" {
  ami           = "ami-04a81a99f5ec58529"  # Ubuntu Server 24.04 LTS AMI (HVM)
  instance_type = "t2.micro"               # Tipo da instância
  key_name      = "my-key-pair"            # Nome do par de chaves

  user_data = file("init-script.sh") # Script de inicialização

  tags = {
    Name = "WordPressServer"
  }

  # Grupo de Segurança
  vpc_security_group_ids = [aws_security_group.sg_wordpress.id]
}

# Par de chaves e envio da chave pública já criada (para acesso ssh)
resource "aws_key_pair" "deployer" {
  key_name   = "my-key-pair"
  public_key = file (var.caminho_chave)  # Caminho para a chave pública
}

# Criação do recurso grupo de segurança
resource "aws_security_group" "sg_wordpress" {
  name_prefix = "wordpress-sg-" #Define um préfixo para ele

  # Liberação das portas de entrada
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

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Liberação de saída para qualquer IP
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}