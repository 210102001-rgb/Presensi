# Multi-stage Docker build for Laravel application
# Stage 1: Dependencies - Install PHP and system dependencies
FROM php:8.2-fpm-alpine AS dependencies

# Install system dependencies and PHP extensions
RUN apk add --no-cache \
    nginx \
    supervisor \
    sqlite \
    sqlite-dev \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev \
    libzip-dev \
    icu-dev \
    oniguruma-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
        pdo_sqlite \
        gd \
        zip \
        bcmath \
        intl \
        mbstring \
        opcache

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /app

# Copy composer files and install PHP dependencies
COPY composer.json composer.lock ./
RUN composer install --no-dev --no-scripts --no-autoloader --optimize-autoloader

# Stage 2: Assets - Build frontend assets
FROM node:20-alpine AS assets

WORKDIR /app

# Copy package files and install Node.js dependencies
COPY package.json package-lock.json ./
RUN npm ci

# Copy source files needed for asset compilation
COPY vite.config.js ./
COPY resources/ ./resources/
COPY public/ ./public/

# Build assets
RUN npm run build

# Stage 3: Runtime - Final production image
FROM php:8.2-fpm-alpine AS runtime

# Install runtime dependencies
RUN apk add --no-cache \
    nginx \
    supervisor \
    sqlite \
    libpng \
    libjpeg-turbo \
    freetype \
    libzip \
    icu \
    curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
        pdo_sqlite \
        gd \
        zip \
        bcmath \
        intl \
        mbstring \
        opcache

# Configure PHP for production
RUN echo "opcache.enable=1" >> /usr/local/etc/php/conf.d/opcache.ini \
    && echo "opcache.memory_consumption=128" >> /usr/local/etc/php/conf.d/opcache.ini \
    && echo "opcache.interned_strings_buffer=8" >> /usr/local/etc/php/conf.d/opcache.ini \
    && echo "opcache.max_accelerated_files=4000" >> /usr/local/etc/php/conf.d/opcache.ini \
    && echo "opcache.revalidate_freq=2" >> /usr/local/etc/php/conf.d/opcache.ini \
    && echo "opcache.fast_shutdown=1" >> /usr/local/etc/php/conf.d/opcache.ini

# Create non-root user for security
RUN addgroup -g 1000 -S www && \
    adduser -u 1000 -D -S -G www www

# Set working directory
WORKDIR /app

# Copy application files
COPY --chown=www:www . .

# Copy PHP dependencies from dependencies stage
COPY --from=dependencies --chown=www:www /app/vendor ./vendor

# Copy built assets from assets stage
COPY --from=assets --chown=www:www /app/public/build ./public/build

# Create required directories and set permissions
RUN mkdir -p /app/storage/logs \
    /app/storage/framework/cache \
    /app/storage/framework/sessions \
    /app/storage/framework/views \
    /app/storage/app/public \
    /app/database \
    && chown -R www:www /app/storage /app/database /app/bootstrap/cache \
    && chmod -R 775 /app/storage /app/database /app/bootstrap/cache

# Configure Nginx
COPY docker/nginx.conf /etc/nginx/nginx.conf
COPY docker/default.conf /etc/nginx/http.d/default.conf

# Configure PHP-FPM
COPY docker/php-fpm.conf /usr/local/etc/php-fpm.d/www.conf

# Configure Supervisor
COPY docker/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Copy entrypoint script
COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost/health || exit 1

# Expose port
EXPOSE 80

# Switch to non-root user
USER www

# Set entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Default command
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]