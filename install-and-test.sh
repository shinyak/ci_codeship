#!/bin/sh
cd /var/www/html/ci_codeship
composer install --dev
./vendor/bin/phpunit tests/Unit
