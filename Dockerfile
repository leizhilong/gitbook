FROM node:lts-slim

MAINTAINER Lei Zhilong <leizhilong@me.com>

ARG VERSION=3.2.3

LABEL version=$VERSION

RUN apt-get install -y build-essential calibre && \
	npm install --global gitbook-cli gitbook-pdf && \
	gitbook fetch ${VERSION} && \
	rm -rf /tmp/* && apt-get clean

WORKDIR /srv/gitbook

VOLUME /srv/gitbook /srv/html

EXPOSE 4000 35729

CMD /usr/local/bin/gitbook serve