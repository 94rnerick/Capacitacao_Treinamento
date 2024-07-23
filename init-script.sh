#!/bin/bash

# Redirecionar saida para um arquivo de log
exec > /home/ubuntu/init-script.log 2>&1
echo "Script de inicialização iniciado em $(date)"

# Atualizar lista de pacotes e instalar dependências
sudo apt update -y
sudo apt install -y docker.io curl wget

# Adicionar ubuntu ao grupo docker
sudo usermod -a -G docker ubuntu

# Instalar Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Criar diretório para o projeto Docker Compose

mkdir -p /home/ubuntu/app
cd /home/ubuntu/app

# Criar arquivo init.sql para configuração do banco de dados
cat <<EOF > /home/ubuntu/app/init.sql
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, ALTER, DROP, INDEX, LOCK TABLES ON wordpress.* TO 'wordpress'@'%';
FLUSH PRIVILEGES;
EOF

# Baixar arquivo docker compose 
sudo wget -O /home/ubuntu/app/docker-compose.yml "https://raw.githubusercontent.com/94rnerick/Capacitacao_Treinamento/main/docker-compose.yml"

# Baixar o Dockerfile
sudo wget -O /home/ubuntu/app/Dockerfile "https://raw.githubusercontent.com/94rnerick/Capacitacao_Treinamento/main/Dockerfile"

sudo cp ./docker-compose.yml /usr/local/bin/  #Copiar o arquivo docker-compose.yml para pasta onde sera executado o serviço pelo systemd

# Criar serviço systemd para Docker Compose
cat <<EOF | sudo tee /etc/systemd/system/docker-compose-app.service
[Unit]
Description=Docker Compose Application Service
After=network.target docker.service
Requires=docker.service

[Service]
Restart=always
WorkingDirectory=/home/ubuntu/app
ExecStart=/usr/local/bin/docker-compose up
ExecStop=/usr/local/bin/docker-compose down
TimeoutStartSec=0

[Install]
WantedBy=multi-user.target
EOF

# Recarregar serviços systemd
sudo systemctl daemon-reload

# Habilitar serviço Docker Compose
sudo systemctl enable docker-compose-app

# Habilitar Docker para iniciar automaticamente
sudo systemctl enable docker

# Iniciar Docker
sudo systemctl start docker

# Iniciar serviço Docker Compose
sudo systemctl start docker-compose-app

# Registro do final da execução do script
echo "Script de inicialização concluído em $(date)"