#!/bin/sh

set -e

# Create required directories
mkdir -p /var/www/storage/framework/cache
mkdir -p /var/www/storage/framework/sessions
mkdir -p /var/www/storage/framework/views
mkdir -p /var/www/storage/logs
mkdir -p /var/www/bootstrap/cache

# Set permissions
chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache

chmod -R 775 /var/www/storage /var/www/bootstrap/cache

# Start php-fpm
exec "$@"