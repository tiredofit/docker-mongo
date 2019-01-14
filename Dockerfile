FROM tiredofit/alpine:3.8
LABEL maintainer="Dave Conroy (dave at tiredofit dot ca)"

### Environment Variables
ENV ENABLE_AUTHENTICATION=FALSE \
    STORAGE_ENGINE=wiredTiger \
    ENABLE_JOURNALING=TRUE \
    ENABLE_SMTP=FALSE

### Installation
RUN set -x && \
    apk add --no-cache -t .mongo-run-deps \
		mongodb \
                mongodb-tools

### Networking
EXPOSE 27017 28017

### Assets
ADD install /
