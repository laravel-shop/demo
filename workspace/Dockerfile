FROM centos
WORKDIR /www/
ADD ./ssh/ /root/.ssh/
RUN yum install -y git \
    && chmod 400 /root/.ssh/id_rsa \
    && chmod 400 /root/.ssh/id_rsa.pub \
    && chmod 400 /root/.ssh/known_hosts

# FROM php:fpm-alpine
# WORKDIR /www/
# COPY --from=composer:1.5 /usr/bin/composer /usr/bin/composer
# COPY --from=0 /www/shop /www/shop
# # USER www-data
# WORKDIR /www/
# RUN cd /www/shop && echo `pwd` && echo `ls -al` && composer config -g repo.packagist composer https://packagist.laravel-china.org \
#  && composer update -vvv

# FROM centos
# WORKDIR /www/
# ADD ./ssh/ /root/.ssh/
# COPY --from=1 /www/shop /www/shop
# RUN yum install -y git \
#     && chmod 400 /root/.ssh/id_rsa \
#     && chmod 400 /root/.ssh/id_rsa.pub \
#     && chmod 400 /root/.ssh/known_hosts

# USER www-data
# WORKDIR /www/
# RUN composer config -g repo.packagist composer https://packagist.laravel-china.org \
# && cd /www/laravel-shop &&  composer install -vvv
# RUN adduser shop