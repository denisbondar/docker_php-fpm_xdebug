FROM php:8-fpm

RUN apt-get update && apt-get install -y wget git unzip \
    && pecl install xdebug-3.0.1 \
    && docker-php-ext-enable xdebug

RUN wget https://getcomposer.org/installer -O - -q \
    | php -- --install-dir=/bin --filename=composer --quiet

ENV COMPOSER_ALLOW_SUPERUSER 1

WORKDIR /var/www
