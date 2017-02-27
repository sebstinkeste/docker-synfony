FROM php:5.6

MAINTAINER Sébastien STINKESTE stinkeste.s@gmail.com

ENV LOCALTIME Europe/Paris
ENV SYNFONY_PROJECT_NAME synfony

RUN apt-get update && \
    apt-get install -y curl php5 vim && \
    rm -rf /var/lib/apt/lists/*

RUN sed -e 's/;date.timezone = /date.timezone = \"${LOCALTIME}\"/' -i /etc/php5/cli/php.ini && \
    mkdir -p /usr/local/bin && \
    curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony && \
    chmod a+x /usr/local/bin/symfony

WORKDIR /var/www/
RUN symfony new ${SYNFONY_PROJECT_NAME}

