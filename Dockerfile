FROM ubuntu:latest

MAINTAINER HCGCLOUD, <service@hcgcloud.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && \
    apt upgrade -y && \
    apt install -y curl lib32gcc1 libc6-i386 lib32stdc++6 && \
    useradd -d /home/container -m container

USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]