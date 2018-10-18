FROM php:7.1-fpm

RUN apt-get update && apt-get install -y libmcrypt-dev zlib1g-dev libpq-dev wget \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install mcrypt pdo_pgsql pgsql \
    && pecl install xdebug-2.6.1 \
    && docker-php-ext-enable xdebug

ADD ./php.ini /usr/local/etc/php/php.ini

WORKDIR /var/www
