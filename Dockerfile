FROM php:7-apache

MAINTAINER mbrevda@gmail.com

COPY config/php.ini /usr/local/etc/php/

RUN apt-get update && apt-get install -y \
    libxml2-dev \
    libmcrypt-dev \
    libzip-dev \
    # for editing files when testing in development
    vim \   
    # for composer to download stuff
    git \     
    # for deployments
    ssh \     
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install \
    mbstring \
    mcrypt \
    opcache \
    pdo_mysql \
    xml \
    zip

#set time zone
RUN ln -sf /usr/share/zoneinfo/GMT /etc/localtime

#install latest composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
