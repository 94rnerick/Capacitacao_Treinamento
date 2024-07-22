# Use a imagem oficial do WordPress como base
FROM wordpress:latest

WORKDIR /var/www/html

# Exponha a porta 80
EXPOSE 80
EXPOSE 8080

# Defina o ponto de entrada
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["apache2-foreground"]

# Exponha a porta 80
EXPOSE 80
EXPOSE 8080