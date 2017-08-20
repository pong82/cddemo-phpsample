FROM php:7.0-apache
#COPY config/php.ini /usr/local/etc/php/ -- Currently not used
COPY src/ /var/www/html/
EXPOSE 80