FROM debian:jessie

MAINTAINER "Dylan Miles" <dylan.g.miles@gmail.com>

ENV NODE_VERSION 0.12.4
ENV NPM_VERSION 2.11.0

RUN apt-get update -y \
    && apt-get install -y \
      php5-curl \
    	php5-cli \
    	php5-mongo \
    	php5-mssql \
    	php5-mysqlnd \
    	php5-pgsql \
    	php5-redis \
    	php5-sqlite \
    	php5-gd \
    	php5-mcrypt \
    	php5-tidy \
    	curl \
    	bzip2 \
    && curl -sL https://deb.nodesource.com/setup | bash - \
    && apt-get install -y nodejs \
	&& npm install -g grunt-cli \
	&& npm install -g phantomjs \
	&& npm cache clear \
    && apt-get remove --purge curl -y \
    && apt-get clean

RUN mkdir -p /data
VOLUME ["/data"]
WORKDIR /data

ENTRYPOINT ["grunt"]
