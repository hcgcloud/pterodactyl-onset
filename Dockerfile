FROM ubuntu:latest

MAINTAINER HCGCLOUD, <service@hcgcloud.com>

ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --add-architecture i386 && \
	apt update && \
    apt upgrade -y && \
    apt install -y curl lib32gcc1 libc6-i386 lib32stdc++6 libmariadbclient18 libcurl4-gnutls-dev:i386 libcurl4:i386 libcurl3-gnutls:i386 && \
    useradd -d /home/container -m container

USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]