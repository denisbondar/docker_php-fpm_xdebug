################################################################################
################################################################################

# PROXIES (to Docker-containers commands)
alias php="docker-compose run --rm php-fpm"
alias composer="docker-compose run --rm php-fpm composer"
alias codecept="docker-compose run --rm php-fpm ./vendor/bin/codecept"

# Symfony
alias console="docker-compose run --rm php-fpm php ./bin/console"

phpunit() {
  EXECUTE="./vendor/bin/phpunit"
  if [ -f "./bin/phpunit" ]; then
      EXECUTE="./bin/phpunit"
  fi
  docker-compose run --rm php-fpm ${EXECUTE} "$@"
}

# Laravel
alias artisan="docker-compose run --rm php-fpm php artisan"

# Yii2
alias yii="docker-compose run --rm php-fpm php yii"

################################################################################
################################################################################

# MAINTENANCE

permissions() {
  sudo chown -R "${USER}":"${USER}" ./
  sudo chmod -R u=rwX,g=rwX,o=rwX ./
}

################################################################################
################################################################################

## DOCKER ENVIRONMENT ALIASES

alias env-up="docker-compose up -d"
alias env-stop="docker-compose stop"
alias env-restart="env-stop && env-up"
alias env-build="docker-compose build"
alias env-pull="docker-compose pull"
alias env-rebuild="env-build && env-restart && permissions"
alias env-logs="docker-compose logs"
alias env-destroy="docker-compose down -v --remove-orphans"

env-init() {
  env-pull
  env-build
  env-restart
  composer --prefer-dist install
  permissions
}
