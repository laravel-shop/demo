ln -s $HOMR/.ssh workspace/ssh
&& docker-compose build \
&& docker-compose up -d workspace php-fpm redis nginx \
&& docker-compose exec workspace rm -rf shop \
&& docker-compose exec workspace git clone git@gitee.com:allet_liability/laravel-shop.git shop \
&& cd code/shop  \
&& cp .env.docker-compose.example .env \
&& touch database/database.sqlite \
&& cd ../../ \
&& docker-compose exec --user=www-data  php-fpm composer -vvv -d=/www/shop install \
&& docker-compose exec --user=www-data  php-fpm php /www/shop/artisan ccb:deploy -vvv \
&& docker-compose exec --user=www-data  php-fpm php /www/shop/artisan migrate:refresh -vvv