help:   ## get Cmd description
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-10s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

cc:   ## Clear cache
	php bin/console cache:clear

vendor:composer.json
	composer install

install:   ## install composer
	composer install


exec:   ## get into php container
	docker exec -it VoteManager-php-fpm bash


mariadb:   ## get into mariadb database
	docker exec -it VoteManager-mariadb mysql -uroot -proot

db:   ## show databases
	docker exec -it VoteManager-mariadb mysql -uroot -proot -e "show databases;"

test: install ## Lance les tests unitaire
#	php ./vendor/bin/phpunit --stop-on-failure
	bin/phpunit


cache-clear: ## Nettoie le cache
	rm -rf ./tmp

server: install ## Lance le serveur interne de PHP
	ENV=dev php -S localhost:8000 -t public/ -d display_errors=1

#https://github.com/MemedDev/docker-php/blob/master/Dockerfile
#https://doc.ubuntu-fr.org/nodejs#depuis_un_personal_package_archives_ppa_depots_officiels_nodesource
node:  ## Install node js and npm
	apt-get install nodejs