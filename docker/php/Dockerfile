FROM php:8.2-fpm-alpine3.20

RUN apk add icu-dev postgresql-dev zlib-dev libpng-dev gd linux-headers

RUN apk add --no-cache --virtual .build-deps $PHPIZE_DEPS && pecl install xdebug && docker-php-ext-enable xdebug && apk del -f .build-deps

# RUN apk add --no-cache --virtual .build-deps $PHPIZE_DEPS imagemagick-dev && pecl install imagick && docker-php-ext-enable imagick && apk del .build-deps

# WARNING: imagick is likely not supported on Alpine: https://github.com/Imagick/imagick/issues/328
# https://pecl.php.net/package/imagick
# https://github.com/Imagick/imagick/commit/5ae2ecf20a1157073bad0170106ad0cf74e01cb6 (causes a lot of build failures, but strangely only intermittent ones 🤔)
# see also https://github.com/Imagick/imagick/pull/641
# this is "pecl install imagick-3.7.0", but by hand so we can apply a small hack / part of the above commit
# Copy the php config file
# COPY ./docker/php/php-fpm.conf /usr/local/etc/php-fpm.d/www.conf
RUN set -eux; \
	apk add --no-cache imagemagick-dev; \
	curl -fL -o imagick.tgz 'https://pecl.php.net/get/imagick-3.7.0.tgz'; \
	echo '5a364354109029d224bcbb2e82e15b248be9b641227f45e63425c06531792d3e *imagick.tgz' | sha256sum -c -; \
	tar --extract --directory /tmp --file imagick.tgz imagick-3.7.0; \
	grep '^//#endif$' /tmp/imagick-3.7.0/Imagick.stub.php; \
	test "$(grep -c '^//#endif$' /tmp/imagick-3.7.0/Imagick.stub.php)" = '1'; \
	sed -i -e 's!^//#endif$!#endif!' /tmp/imagick-3.7.0/Imagick.stub.php; \
	grep '^//#endif$' /tmp/imagick-3.7.0/Imagick.stub.php && exit 1 || :; \
	docker-php-ext-install /tmp/imagick-3.7.0; \
	rm -rf imagick.tgz /tmp/imagick-3.7.0

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN docker-php-ext-install pdo pdo_pgsql bcmath opcache

RUN docker-php-ext-enable pdo pdo_pgsql bcmath opcache

RUN docker-php-ext-configure intl && docker-php-ext-install intl

COPY . /app

VOLUME ["/app"]



# ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

# # RUN test -f /usr/local/bin/install-php-extensions || install-php-extensions gd xdebug bcmath gd intl opcache pdo pdo_pgsql imagick

# RUN install-php-extensions @composer

# RUN install-php-extensions gd xdebug bcmath intl opcache pdo pdo_pgsql imagick

# FROM php:8.2-fpm-alpine3.20

# # Copy the php config file
# COPY ./docker/php/php-fpm.conf /usr/local/etc/php-fpm.d/www.conf


# # Install mysqli PHP extension for MySQL support
# RUN docker-php-ext-install xdebug bcmath intl opcache pdo pdo_pgsql imagick

# COPY . /app

# VOLUME ["/app"]
# Установите,composer и следующие расширения на php: 
