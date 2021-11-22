FROM amery/docker-ubuntu-vscode-nodejs-golang-builder:latest

#
# world upgrade
#
RUN apt-get update && apt-get dist-upgrade -y && apt-get clean

#
# extra dependencies
#
#RUN apt-get update && apt-get dist-upgrade -y && apt-get install --no-install-recommends -y \
#	ssh-client \
#	&& apt-get clean

COPY code-nuxt.sh /etc/entrypoint.d/
COPY npm-nuxt.sh /etc/entrypoint.d/
