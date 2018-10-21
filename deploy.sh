cp  env.example .env
docker-compose build php-cli && \
docker-compose build --no-cache workspace