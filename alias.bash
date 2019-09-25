################################################################################
################################################################################

## DOCKER ENVIRONMENT ALIASES

env-up() {
  docker-compose up -d
}

env-stop() {
  docker-compose stop
}

env-restart() {
  env-stop
  env-up
}

env-build() {
  docker-compose build
}

env-pull() {
  docker-compose pull
}

env-rebuild() {
  env-build
  env-restart
  permissions
}

env-logs() {
  docker-compose logs "$@"
}

env-init() {
  env-pull
  env-build
  env-restart
  composer --prefer-dist install
  permissions
}

env-destroy() {
  docker-compose down -v --remove-orphans
}

################################################################################
################################################################################

# PROXIES (to Docker-containers commands)

composer() {
  docker-compose run --rm php-fpm composer "$@"
}

codecept() {
  docker-compose run --rm php-fpm vendor/bin/codecept "$@"
}

# Symfony

console() {
  docker-compose run --rm php-fpm php bin/console "$@"
}

phpunit() {
  EXECUTE="vendor/bin/phpunit"
  if [ -f "bin/phpunit" ]; then
      EXECUTE="bin/phpunit"
  fi
  docker-compose run --rm php-fpm ${EXECUTE} "$@"
}

# Laravel

artisan() {
  docker-compose run --rm php-fpm php artisan "$@"
}

# Yii2

yii() {
  docker-compose run --rm php-fpm php yii "$@"
}

################################################################################
################################################################################

# MAINTENANCE

permissions() {
  sudo chown -R "${USER}":"${USER}" ./
  sudo chmod -R u=rwX,g=rwX,o=rwX ./
}
