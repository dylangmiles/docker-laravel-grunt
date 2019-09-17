FROM debian:jessie

MAINTAINER "Dylan Miles" <dylan.g.miles@gmail.com>

ENV NODE_VERSION 8.16.1
ENV NPM_VERSION 6.10.3

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
    	bzip2 
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - 

RUN apt-get install -y nodejs

RUN npm install -g grunt-cli 

RUN npm install -g phantomjs-prebuilt --unsafe-perm

RUN npm install -g sass

RUN npm cache clear --force \
    && apt-get remove --purge curl -y \
    && apt-get clean

RUN mkdir -p /data
VOLUME ["/data"]
WORKDIR /data

ENTRYPOINT ["grunt"]
