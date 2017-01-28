FROM php:5.5-apache
ARG USER_NAME
ARG USER_ID
ARG WP_PLUGINS
RUN useradd -u $USER_ID $USER_NAME -m
RUN usermod -a -G www-data $USER_NAME
RUN a2enmod rewrite
RUN docker-php-ext-install mysqli
WORKDIR /tmp
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
WORKDIR /var/www/html
RUN chmod 2775 /var/www/html

USER $USER_NAME
RUN newgrp www-data
RUN wp core download
ADD .htaccess /var/www/html/.htaccess
ADD wp-config.php /var/www/html/wp-config.php

USER root
RUN chown $USER_NAME:www-data .htaccess wp-config.php


