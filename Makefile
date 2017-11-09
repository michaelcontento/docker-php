build: build-7.0 build-7.1

build-7.0:
	echo "Building: 7.0"
	docker build --quiet --tag michaelcontento/php:7.0 7.0

	echo "Building: 7.0-debug"
	docker build --quiet --tag michaelcontento/php:7.0-debug 7.0-debug

	echo "Building: 7.0-laravel"
	docker build --quiet --tag michaelcontento/php:7.0-laravel 7.0-laravel

	echo "Building: 7.0-laravel-debug"
	docker build --quiet --tag michaelcontento/php:7.0-laravel-debug 7.0-laravel-debug

build-7.1:
	echo "Building: 7.1"
	docker build --quiet --tag michaelcontento/php:7.1 7.1
	docker tag michaelcontento/php:7.1 michaelcontento/php:7
	docker tag michaelcontento/php:7.1 michaelcontento/php:latest

	echo "Building: 7.1-debug"
	docker build --quiet --tag michaelcontento/php:7.1-debug 7.1-debug
	docker tag michaelcontento/php:7.1-debug michaelcontento/php:7-debug
	docker tag michaelcontento/php:7.1-debug michaelcontento/php:debug

	echo "Building: 7.1-laravel"
	docker build --quiet --tag michaelcontento/php:7.1-laravel 7.1-laravel
	docker tag michaelcontento/php:7.1-laravel michaelcontento/php:7-laravel
	docker tag michaelcontento/php:7.1-laravel michaelcontento/php:laravel

	echo "Building: 7.1-laravel-debug"
	docker build --quiet --tag michaelcontento/php:7.1-laravel-debug 7.1-laravel-debug
	docker tag michaelcontento/php:7.1-laravel-debug michaelcontento/php:7-laravel-debug
	docker tag michaelcontento/php:7.1-laravel-debug michaelcontento/php:laravel-debug

push: push-7.0 push 7.1

push-7.0:
	echo "Pushing: 7.0"
	docker push michaelcontento/php:7.0
	docker push michaelcontento/php:7.0-debug
	docker push michaelcontento/php:7.0-laravel
	docker push michaelcontento/php:7.0-laravel-debug

push-7.1:
	echo "Pushing: 7.1"
	docker push michaelcontento/php:7.1
	docker push michaelcontento/php:7.1-debug
	docker push michaelcontento/php:7.1-laravel
	docker push michaelcontento/php:7.1-laravel-debug

	echo "Pushing: 7"
	docker push michaelcontento/php:7
	docker push michaelcontento/php:7-debug
	docker push michaelcontento/php:7-laravel
	docker push michaelcontento/php:7-laravel-debug

	echo "Pushing: latest"
	docker push michaelcontento/php:debug
	docker push michaelcontento/php:laravel
	docker push michaelcontento/php:laravel-debug
	docker push michaelcontento/php:latest

.SILENT:

.PHONY: build build-7.0 build-7.1 push push-7.0 push-7.1