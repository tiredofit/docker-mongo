# github.com/tiredofit/docker-mongo

[![GitHub release](https://img.shields.io/github/v/tag/tiredofit/docker-mongo?style=flat-square)](https://github.com/tiredofit/docker-mongo/releases/latest)
[![Build Status](https://img.shields.io/github/workflow/status/tiredofit/docker-mongo/build?style=flat-square)](https://github.com/tiredofit/docker-mongo/actions?query=workflow%3Abuild)
[![Docker Stars](https://img.shields.io/docker/stars/tiredofit/mongodb.svg?style=flat-square&logo=docker)](https://hub.docker.com/r/tiredofit/mongodb/)
[![Docker Pulls](https://img.shields.io/docker/pulls/tiredofit/mongodb.svg?style=flat-square&logo=docker)](https://hub.docker.com/r/tiredofit/mongodb/)
[![Become a sponsor](https://img.shields.io/badge/sponsor-tiredofit-181717.svg?logo=github&style=flat-square)](https://github.com/sponsors/tiredofit)
[![Paypal Donate](https://img.shields.io/badge/donate-paypal-00457c.svg?logo=paypal&style=flat-square)](https://www.paypal.me/tiredofit)

* * *

## About

Dockerfile to build a [MongoDB](https://github.com/mongodbserver/mongodb) KV Database Server

* Contains Mongo Tools included
* Compiled from Source

## Maintainer

- [Dave Conroy](https://github.com/tiredofit/)

## Installation

### Build from Source
Clone this repository and build the image with `docker build <arguments> (imagename) .`

### Prebuilt Images
Builds of the image are available on [Docker Hub](https://hub.docker.com/r/tiredofit/mongodb)

Builds of the image are also available on the [Github Container Registry](https://github.com/tiredofit/docker-/pkgs/container/docker-) 
 
```
docker pull ghcr.io/tiredofit/docker-:(imagetag)
``` 

The following image tags are available along with their tagged release based on what's written in the [Changelog](CHANGELOG.md):

| Container OS | Mongo Version | Tag          |
| ------------ | ------------- | ------------ |
| Debian       | `4.2`         | `4.2-latest` |
| Debian       | `4.4`         | `4.4-latest` |
| Debian       | `5.0`         | `5.0-latest` |

#### Multi Architecture
Images are built primarily for `amd64` architecture, and may also include builds for `arm/v7`, `arm64` and others. These variants are all unsupported. Consider [sponsoring](https://github.com/sponsors/tiredofit) my work so that I can work with various hardware. To see if this image supports multiple architecures, type `docker manifest (image):(tag)`

## Configuration

### Quick Start

* The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/). See the examples folder for a working
[docker-compose.yml](examples/docker-compose.yml) that can be modified for development or production use.

* Set various [environment variables](#environment-variables) to understand the capabilities of this image.
* Map [persistent storage](#data-volumes) for access to configuration and data files for backup.

### Persistent Storage

The following directories are used for configuration and can be mapped for persistent storage.

| Directory   | Description    |
| ----------- | -------------- |
| `/data/db/` | Database Files |
| `/logs/`    | Logfiles       |

### Environment Variables

#### Base Images used

This image relies on an [Debian Linux](https://hub.docker.com/r/tiredofit/debian) base image that relies on an [init system](https://github.com/just-containers/s6-overlay) for added capabilities. Outgoing SMTP capabilities are handlded via `msmtp`. Individual container performance monitoring is performed by [zabbix-agent](https://zabbix.org). Additional tools include: `bash`,`curl`,`less`,`logrotate`, `nano`.

Be sure to view the following repositories to understand all the customizable options:

| Image                                                  | Description                            |
| ------------------------------------------------------ | -------------------------------------- |
| [OS Base](https://github.com/tiredofit/docker-debian/) | Customized Image based on Debian Linux |

| Parameter               | Description                                                                                                    | Default                  |
| ----------------------- | -------------------------------------------------------------------------------------------------------------- | ------------------------ |
| `SETUP_MODE`            | Auto configure based on environment variables `AUTO` or `MANUAL`                                               | `AUTO`                   |
| `ADDITIONAL_PARAMETERS` | Pass additional parameters to the mongod process (works with `SETUP_MODE=MANUAL`                               |                          |
| `CONFIG_FILE`           | Map and use a config file. Works with both `SETUP_MODE` values. All environment variables override config file |                          |
| `ADMIN_NAME`            | Administrator Account name                                                                                     | `admin`                  |
| `ADMIN_PASS`            | Password of Admin user                                                                                         | `admin`                  |
| `DATA_PATH`             | Data Location                                                                                                  | `/data/db`               |
| `DB_NAME`               | Name of Database to create                                                                                     | `admin`                  |
| `DB_PORT`               | MongoDB Listening Port                                                                                         | `27017`                  |
| `ENABLE_AUTHENTICATION` | Enable Authentication Features                                                                                 | `FALSE`                  |
| `ENABLE_JOURNALING`     | Enable Journaling `TRUE` `FALSE`                                                                               | `TRUE`                   |
| `LOG_PATH`              | Log Path                                                                                                       | `/logs`                  |
| `MAX_CONNECTIONS`       | Maximum Connections                                                                                            |                          |
| `OPLOG_SIZE`            | OPLog Size                                                                                                     |                          |
| `SKIP_INIT`             | Skip creating databases and admin users if used in a replica set                                               | `FALSE`                  |
| `ENABLE_REPLICATION`    | Enable Replication                                                                                             | `FALSE`                  |
| `REPLICATION_SET`       | Name of Replication Set                                                                                        | `rs0`                    |
| `REPLICATION_INIT`      | Initialize the Replica set                                                                                     |                          |
| `REPLICATION_HOSTS`     | Comma seperated list of hosts to init the replica set                                                          | `0:localhost:$DB_PORT:1` |
|                         | Syntax is `id:hostname:port:priority`                                                                          |                          |


### Networking
| Port    | Description    |
| ------- | -------------- |
| `27017` | MongoDB Server |
| `28017` | MongoDB Server |

* * *
## Maintenance

### Shell Access

For debugging and maintenance purposes you may want access the containers shell.

``bash
docker exec -it (whatever your container name is) bash
``
## Support

These images were built to serve a specific need in a production environment and gradually have had more functionality added based on requests from the community.
### Usage
- The [Discussions board](../../discussions) is a great place for working with the community on tips and tricks of using this image.
- [Sponsor me](https://tiredofit.ca/sponsor) for personalized support
### Bugfixes
- Please, submit a [Bug Report](issues/new) if something isn't working as expected. I'll do my best to issue a fix in short order.

### Feature Requests
- Feel free to submit a feature request, however there is no guarantee that it will be added, or at what timeline.
- [Sponsor me](https://tiredofit.ca/sponsor) regarding development of features.

### Updates
- Best effort to track upstream changes, More priority if I am actively using the image in a production environment.
- [Sponsor me](https://tiredofit.ca/sponsor) for up to date releases.

## License
MIT. See [LICENSE](LICENSE) for more details.

## References

* https://github.com/mongodb

