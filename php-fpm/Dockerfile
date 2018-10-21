FROM php:fpm-alpine
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && apk add --update \
    # php7 \
    # php7-fpm \
    php7-pdo \
    php7-pdo_mysql \
    php7-mcrypt \
    php7-mbstring \
    php7-xml \
    php7-openssl \
    php7-json \
    php7-phar \
    php7-zip \
    php7-dom \
    php7-session \
    php7-zlib && \
    php7 -r "copy('http://getcomposer.org/installer', 'composer-setup.php');" && \
    php7 composer-setup.php --install-dir=/usr/bin --filename=composer && \
    php7 -r "unlink('composer-setup.php');" && \
    rm -rf /usr/bin/php && \
    rm -rf /etc/php7/conf.d/php.ini && \
    ln -s /usr/bin/php7 /usr/bin/php && \
    ln -s /etc/php7/php.ini /etc/php7/conf.d/php.ini
CMD ["php-fpm7"]
expose 9000