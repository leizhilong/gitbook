FROM node:lts-slim

MAINTAINER Lei Zhilong <leizhilong@me.com>

ARG VERSION=3.2.3

LABEL version=$VERSION

RUN apt-get update && \
	apt-get install -y build-essential calibre && \
	apt-get clean

RUN npm install --global gitbook-cli && \
	gitbook fetch ${VERSION} && \
	rm -rf /tmp/*

COPY copyPluginAssets.js /root/.gitbook/versions/${VERSION}/lib/output/website/copyPluginAssets.js

WORKDIR /srv/gitbook

VOLUME /srv/gitbook /srv/html

EXPOSE 4000 35729

CMD /usr/local/bin/gitbook serve