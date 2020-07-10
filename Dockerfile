FROM node:lts-slim

MAINTAINER Lei Zhilong <leizhilong@me.com>

ARG VERSION=3.2.3

LABEL version=$VERSION

RUN apt-get update && \
	apt-get install -y build-essential calibre && \
	&& apt-get clean

RUN npm install --global gitbook-cli && \
	gitbook fetch ${VERSION} && \
	rm -rf /tmp/* && \
	# fix isse:https://github.com/GitbookIO/gitbook-cli/issues/55
	sed -i 's/confirm: .*$/confirm: false/g' ~/.gitbook/versions/${VERSION}/lib/output/website/copyPluginAssets.js && \
	cat ~/.gitbook/versions/${VERSION}/lib/output/website/copyPluginAssets.js | grep confirm

WORKDIR /srv/gitbook

VOLUME /srv/gitbook /srv/html

EXPOSE 4000 35729

CMD /usr/local/bin/gitbook serve