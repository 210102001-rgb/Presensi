#!/bin/sh
set -e

echo "Starting Laravel application initialization..."

# Wait for any mounted volumes to be ready
sleep 2

# Ensure required directories exist with proper permissions
mkdir -p /app/storage/logs
mkdir -p /app/storage/framework/cache
mkdir -p /app/storage/framework/sessions
mkdir -p /app/storage/framework/views
mkdir -p /app/storage/app/public
mkdir -p /app/database
mkdir -p /app/bootstrap/cache

# Set proper permissions (as root before switching to www user)
if [ "$(id -u)" = "0" ]; then
    chown -R www:www /app/storage /app/database /app/bootstrap/cache
    chmod -R 775 /app/storage /app/database /app/bootstrap/cache
fi

# Generate application key if it doesn't exist
if [ ! -f /app/.env ]; then
    echo "Creating .env file from .env.example..."
    cp /app/.env.example /app/.env
fi

# Check if APP_KEY is set, if not generate one
if ! grep -q "APP_KEY=base64:" /app/.env; then
    echo "Generating application key..."
    php artisan key:generate --force
fi

# Create SQLite database if it doesn't exist
if [ ! -f /app/database/database.sqlite ]; then
    echo "Creating SQLite database..."
    touch /app/database/database.sqlite
    chown www:www /app/database/database.sqlite
    chmod 664 /app/database/database.sqlite
fi

# Run database migrations
echo "Running database migrations..."
php artisan migrate --force

# Clear and cache configuration for production
echo "Optimizing application..."
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Create storage link if it doesn't exist
if [ ! -L /app/public/storage ]; then
    echo "Creating storage link..."
    php artisan storage:link
fi

# Ensure log files exist
touch /app/storage/logs/laravel.log
chown www:www /app/storage/logs/laravel.log

echo "Laravel application initialization completed."

# Execute the main command
exec "$@"