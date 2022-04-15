FROM debian:jessie

MAINTAINER "Dylan Miles" <dylan.g.miles@gmail.com>

ENV NODE_VERSION 8.16.1
ENV NPM_VERSION 6.10.3

RUN apt-key update \
    && apt-get update -y \
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

RUN apt-get install -y nodejs --force-yes

RUN npm install -g grunt-cli

RUN npm install -g sass

# Build phantomJS
#RUN npm install -g phantomjs
RUN apt-get install -y \
    git \
    build-essential \
    g++ \
    flex \
    bison \
    gperf \
    ruby  \
    perl \
    libsqlite3-dev  \
    libfontconfig1-dev  \
    libicu-dev  \
    libfreetype6  \
    libssl-dev \
    libpng-dev  \
    libjpeg-dev  \
    python  \
    libx11-dev  \
    libxext-dev

RUN git clone https://github.com/ariya/phantomjs.git

RUN cd phantomjs \
    && git checkout 2.1.1 \
    && git submodule init \
    && git submodule update

RUN cd phantomjs \
    && python build.py

RUN npm cache clear --force \
    && apt-get remove --purge curl -y \
    && apt-get clean

RUN mkdir -p /data
VOLUME ["/data"]
WORKDIR /data

ENTRYPOINT ["grunt"]
