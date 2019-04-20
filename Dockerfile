FROM tiredofit/mongo-builder:latest as mongo-packages

FROM tiredofit/alpine:edge
LABEL maintainer="Dave Conroy (dave at tiredofit dot ca)"

### Copy Mongo Packages
COPY --from=mongo-packages / /usr/src/apk

### Environment Variables
ENV ENABLE_AUTHENTICATION=FALSE \
    STORAGE_ENGINE=wiredTiger \
    ENABLE_JOURNALING=TRUE \
    ENABLE_SMTP=FALSE

### Installation
RUN set -x && \
    apk update && \
    apk upgrade && \
    cd /usr/src/apk && \
    ls -l && \
    apk add --allow-untrusted --no-cache -t .mongo-run-deps \
 		mongodb*.apk \
                mongodb-tools*.apk \
                && \
    rm -rf /usr/src/* /var/cache/apk/*

### Networking
EXPOSE 27017 28017

### Assets
ADD install /
