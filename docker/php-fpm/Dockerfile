FROM php:7.1-fpm

RUN pecl install xdebug-2.6.1 \
    && docker-php-ext-enable xdebug

ADD ./php.ini /usr/local/etc/php/php.ini

WORKDIR /var/www
