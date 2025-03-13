FROM php:8.2-apache

RUN docker-php-ext-install pdo pdo_mysql

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Copy Apache configuration
COPY apache.conf /etc/apache2/sites-available/000-default.conf

# Configure PHP
RUN echo "memory_limit=256M" > /usr/local/etc/php/conf.d/memory-limit.ini

# Set proper permissions
RUN chown -R www-data:www-data /var/www/html
