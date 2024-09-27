FROM php:8.2-fpm-alpine3.20

RUN apk add icu-dev postgresql-dev zlib-dev libpng-dev gd linux-headers imagemagick-dev autoconf make $PHPIZE_DEPS

RUN  pecl install xdebug && pecl install imagick && docker-php-ext-enable xdebug imagick

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN docker-php-ext-install pdo pdo_pgsql bcmath opcache intl && docker-php-ext-configure intl 

COPY . /app

