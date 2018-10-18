FROM php:apache

RUN apt-get update && apt-get install -y zip libzip-dev libpng-dev \
    && docker-php-ext-install pdo_mysql gd zip \
    && rm -rf /var/lib/apt/lists/*

# Composer installation.
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# https://getcomposer.org/doc/03-cli.md#composer-allow-superuser
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN composer global require hirak/prestissimo --prefer-dist --no-progress --no-suggest --classmap-authoritative \
	&& composer clear-cache
ENV PATH="${PATH}:/root/.composer/vendor/bin"

RUN mkdir /app-tmp

ADD akaunting-1.2.16.zip /app-tmp
RUN cd /app-tmp/ && unzip akaunting-1.2.16.zip && rm akaunting-1.2.16.zip 

RUN cd /app-tmp/akaunting-master && cp -R . /var/www/html/


#COPY . /var/www/html/

# Authorize these folders to be edited
RUN chmod -R 777 /var/www/html/storage
RUN chmod -R 777 /var/www/html/bootstrap/cache
RUN cd /var/www/html && composer install

RUN chown -R www-data:www-data /var/www/html


ADD .env /var/www/html



# Allow rewrite
RUN a2enmod rewrite
