# Use a imagem oficial do WordPress como base
FROM wordpress:latest

WORKDIR /var/www/html # Diretorio de trabalho do container

# Exponha a porta 80 e 8080
EXPOSE 80
EXPOSE 8080

# Defina o ponto de entrada
ENTRYPOINT ["docker-entrypoint.sh"]

# Inicia o servidor Apache
CMD ["apache2-foreground"]