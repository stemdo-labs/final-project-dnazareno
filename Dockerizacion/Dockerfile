# FROM php:8.2-cli
# COPY . /usr/src/myapp
# WORKDIR /usr/src/myapp
# CMD [ "php", "index.php" ]
FROM php:8.2-apache
 
# Instalar las extensiones necesarias de PHP
RUN docker-php-ext-install mysqli pdo pdo_mysql
 
# Copiar el contenido de la aplicación al directorio raíz de Apache
COPY . /var/www/html/
 
# Establecer el directorio de trabajo
WORKDIR /var/www/html/
 
# Dar permisos adecuados a los archivos
RUN chown -R www-data:www-data /var/www/html
 
# Exponer el puerto 80
EXPOSE 80