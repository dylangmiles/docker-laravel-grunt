FROM dylanlindgren/docker-phpcli:latest

MAINTAINER "Dylan Miles" <dylan.g.miles@gmail.com>

WORKDIR /tmp

RUN apt-get update -y && \
    apt-get install -y php5-mcrypt curl git && \
    curl -sL https://deb.nodesource.com/setup | bash -  && \
    apt-get install -y nodejs  && \
    apt-get remove --purge curl -y  && \
    apt-get clean  && \
    npm install -g grunt

RUN mkdir -p /data/www
VOLUME ["/data"]
WORKDIR /data/www

ENTRYPOINT ["grunt"]
CMD ["help"]