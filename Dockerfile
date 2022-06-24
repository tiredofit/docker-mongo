FROM docker.io/tiredofit/debian:bullseye
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

ARG MONGO_VERSION
ARG MONGO_TOOLS_VERSION
ARG GO_VERSION=1.18.3

ENV MONGO_VERSION=${MONGO_VERSION:-r4.2.20} \
    MONGO_TOOLS_VERSION=${MONGO_TOOLS_VERSION:-master} \
    CONTAINER_ENABLE_MESSAGING=FALSE \
    IMAGE_NAME="tiredofit/mongo:4.2" \
    IMAGE_REPO_URL="https://github.com/tiredofit/docker-mongo"

RUN set -x && \
    addgroup --gid 27017 mongodb && \
    adduser --uid 27017 --gid 27017 --gecos "Mongo User" --disabled-password mongodb && \
    apt-get update && \
    apt-get upgrade -y && \
    BUILD_DEPS="\
               build-essential \
               git \
               libcurl4-openssl-dev \
               liblzma-dev \
               libkrb5-dev \
               libssl-dev \
               python3-dev \
               python3-pip \
               " \
               && \
    apt-get install -y \
                    ${BUILD_DEPS} \
                    && \
    \
    mkdir -p /usr/local/go && \
    curl -sSLk https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz | tar xvfz - --strip 1 -C /usr/local/go && \
    git clone https://github.com/mongodb/mongo-tools /usr/src/mongo-tools && \
    cd /usr/src/mongo-tools && \
    git checkout "${MONGO_TOOLS_VERSION}" && \
    export GOROOT=/usr/local/go && \
    export PATH=/usr/local/go/bin:$PATH && \
    ./make build && \
    strip bin/* && \
    mv bin/* /usr/sbin && \
    \
    git clone https://github.com/mongodb/mongo /usr/src/mongo && \
    cd /usr/src/mongo && \
    git checkout "${MONGO_VERSION}" && \
    python3 -m pip install -r etc/pip/compile-requirements.txt && \
    python3 buildscripts/scons.py core --disable-warnings-as-errors && \
    strip build/opt/mongo/mongo* && \
    mv build/opt/mongo/mongo* /usr/sbin && \
    \
    apt-get purge -y ${BUILD_DEPS} && \
    apt-get clean -y && \
    rm -rf /usr/src/* && \
    rm -rf /usr/local/go && \
    rm -rf /root/go && \
    rm -rf /root/.cache && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 27017 28017

ADD install /
