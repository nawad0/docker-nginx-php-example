FROM php:8.2-fpm-alpine3.20

RUN set -eux && apk add icu-dev postgresql-dev zlib-dev libpng-dev \
    gd linux-headers imagemagick-dev imagemagick autoconf make \
    && apk add --update --no-cache --virtual .build-dependencies $PHPIZE_DEPS \
    && pecl install xdebug && pecl install imagick && docker-php-ext-enable xdebug imagick \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && docker-php-ext-install pdo pdo_pgsql bcmath opcache intl \
    && docker-php-ext-configure intl


