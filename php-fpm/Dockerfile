FROM php:fpm-alpine
WORKDIR /www/
COPY --from=composer:1.5 /usr/bin/composer /usr/bin/composer
USER www-data
RUN composer config -g repo.packagist composer https://packagist.laravel-china.org 