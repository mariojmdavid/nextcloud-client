# docker build --rm -t nc-client .
FROM ubuntu:18.04
MAINTAINER Mario David <mariojmdavid@gmail.com>
LABEL description="Nextcloud client tool"

RUN apt-get update && \
    apt-get -y upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install \
      python3 \
      software-properties-common \
      tar \
      wget && \
    add-apt-repository ppa:nextcloud-devs/client && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install \
      nextcloud-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/
