FROM php:5.6-apache

USER root

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y \
        libpng-dev \
        zlib1g-dev \
        libxml2-dev \
        libzip-dev \
        libonig-dev \
        zip \
        curl \
        unzip \
    && docker-php-ext-configure gd \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install zip \
    && docker-php-source delete

ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
# COPY ./vhost.conf /etc/apache2/sites-available/000-default.conf

RUN a2enmod rewrite headers

RUN cp "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"
RUN sed -ri -e 's!;date.timezone =!date.timezone = "Europe/Paris"!g' $PHP_INI_DIR/php.ini

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN chown -R www-data:www-data /var/www/html \
    && a2enmod rewrite

CMD bash -c 'cd /var/www/html && composer install && php artisan key:generate'
# CMD bash -c 'mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini" && sed -i "s/;date.timezone=/;date.timezone=Europe/Paris/g" $PHP_INI_DIR/php.ini && cd /var/www/html && composer install && php artisan key:generate'