# Use a imagem oficial do WordPress como base
FROM wordpress:latest

# Mantenha a imagem atualizada
RUN apt-get update && apt-get upgrade -y

# Defina o ponto de entrada
ENTRYPOINT ["docker-entrypoint.sh"]

# Exponha a porta 80
EXPOSE 80
EXPOSE 8080