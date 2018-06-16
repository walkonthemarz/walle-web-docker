#FROM php:7.1.18-apache-jessie
FROM debian:stretch

MAINTAINER walkonthemarz@gmail.com

COPY sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y git curl apache2 php7.0 php7.0-json php7.0-curl php7.0-xml php7.0-mysqlnd php7.0-gd php7.0-gmp php7.0-bz2 php7.0-zip php7.0-calendar php7.0-iconv php7.0-intl php7.0-mbstring php7.0-mcrypt php7.0-mysqli php7.0-opcache  php7.0-pgsql php7.0-soap \
	&& curl -sS https://getcomposer.org/installer | php \
	&& mv composer.phar /usr/local/bin/composer \
	&& composer config -g repo.packagist composer https://packagist.phpcomposer.com
	
WORKDIR /walle
RUN git clone https://github.com/meolu/walle-web.git \
	&& cd walle-web \
	&& composer install \
	&& ./yii walle/setup
