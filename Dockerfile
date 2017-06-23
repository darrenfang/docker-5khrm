FROM php:5-apache

ENV BUILD_DATE 2017-06-23

ADD http://www.5kcrm.com/download/5khrm-v0.1.zip /tmp/src.zip

RUN apt-get -yqq update && \
    apt-get -yqq upgrade && \
    apt-get install -y \
    libpng-dev \
    unzip && \
    docker-php-ext-install -j$(nproc) gd mysql mysqli pdo pdo_mysql && \
    cd /tmp && \
    unzip /tmp/src.zip && \
    mv /tmp/5khrm/* /var/www/html && \
    apt-get autoremove -y \
    unzip && \
    rm -rf /tmp/* && \
    rm -rf /var/lib/apt/lists/* && \
    chown -R www-data:www-data /var/www/
