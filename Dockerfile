FROM php:5.6-fpm

MAINTAINER Sébastien STINKESTE stinkeste.s@gmail.com

ENV LOCALTIME Europe/Paris

ENV SYNFONY_PROJECT_NAME synfony

RUN apt-get update && apt-get install -y vim net-tools wget curl php5

RUN echo "date.timezone = \"${LOCALTIME}\"" >> /etc/php5/cli/php.ini

RUN mkdir -p /usr/local/bin
RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
RUN chmod a+x /usr/local/bin/symfony

WORKDIR /var/www/
RUN symfony new ${SYNFONY_PROJECT_NAME}

