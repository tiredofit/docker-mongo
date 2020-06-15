FROM tiredofit/debian:buster
LABEL maintainer="Dave Conroy (dave at tiredofit dot ca)"

### Environment Variables
ENV MONGO_VERSION=4.2.7 \
    MONGO_MAJOR=4.2 \
    ENABLE_AUTHENTICATION=FALSE \
    STORAGE_ENGINE=wiredTiger \
    ENABLE_JOURNALING=TRUE \
    ENABLE_SMTP=FALSE

### Installation
RUN set -x && \
    \
### Add Users
    addgroup --gid 27017 mongodb && \
    adduser --uid 27017 --gid 27017 --gecos "Mongo User" --disabled-password mongodb && \
    \
### Download Mongo GPG Key       \
    curl -sSL https://www.mongodb.org/static/pgp/server-${MONGO_MAJOR}.asc | sudo apt-key add - && \
    echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/${MONGO_MAJOR} main" | sudo tee /etc/apt/sources.list.d/mongodb.list && \
    apt-get update && \
    apt-get upgrade -y && \
### Installation
    apt-get install -y \
                       mongodb-org-server=$MONGO_VERSION \
                       mongodb-org-mongos=$MONGO_VERSION \
                       mongodb-org-shell=$MONGO_VERSION \
                       mongodb-org-tools=$MONGO_VERSION \
                       && \
    \
### Cleanup
    apt-get clean && \
    rm -rf /etc/mongod.conf && \
    rm -rf /var/lib/mongodb && \
    rm -rf /var/lib/apt/lists/*

### Networking
EXPOSE 27017 28017

### Assets
ADD install /
