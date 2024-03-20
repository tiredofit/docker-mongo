## 5.0-4.0.14 2024-03-20 <dave at tiredofit dot ca>

   ### Added
      - MongoDB 5.0.26


## 5.0-4.0.13 2024-02-20 <dave at tiredofit dot ca>

   ### Added
      - Mongo 5.0.25


## 5.0-4.0.12 2024-01-11 <dave at tiredofit dot ca>

   ### Added
      - MongoDB 5.0.24
      - Golang build 1.21.6


## 5.0-4.0.11 2023-11-20 <dave at tiredofit dot ca>

   ### Added
      - MongoDB 5.0.23
      - Go Build 1.21.4


## 5.0-4.0.10 2023-10-25 <dave at tiredofit dot ca>

   ### Added
      - MongoDB 5.0.22


## 5.0-4.0.9 2023-05-15 <dave at tiredofit dot ca>

   ### Added
      - MongoDB 5.0.18


## 5.0-4.0.8 2023-04-21 <dave at tiredofit dot ca>

   ### Added
      - MongoDB 5.0.17


## 5.0-4.0.7 2023-04-06 <dave at tiredofit dot ca>

   ### Added
      - MongoDB 5.0.16


## 4.0.6 2022-12-12 <dave at tiredofit dot ca>

   ### Changed
      - Fix build process
      - Fix issue with creating a secondary user


## 4.0.5 2022-10-04 <dave at tiredofit dot ca>

   ### Added
      - Mongo 5.0.13

   ### Changed
      - Change the way git cloning works in Dockerfile


## 4.0.4 2022-08-17 <dave at tiredofit dot ca>

   ### Changed
      - Switch to using exec to launch process


## 4.0.3 2022-08-04 <dave at tiredofit dot ca>

   ### Added
      - Go buildchain 1.18.5
      - Refresh base image


## 4.0.2 2022-07-16 <dave at tiredofit dot ca>

   ### Added
      - Rework image
      - Introduce Replica set initialization
      - Add ability to load Config File
      - Add ability to skip initialization for secondary servers


## 4.0.1 2022-06-24 <dave at tiredofit dot ca>

   ### Changed
      - Update image name when inside container


## 4.0.0 2022-06-10 <dave at tiredofit dot ca>

   ### Added
      - Debian Bullseye
      - MongoDB 5.0.9


## 3.5.0 2020-06-15 <dave at tiredofit dot ca>

   ### Added
      - Update base image to support tiredofit/debian base image 5.x series
      - MongoDB 4.2.7


## 3.4.1 2020-01-17 <dave at tiredofit dot ca>

   ### Changed
      - Fix container startup routine


## 3.4.0 2020-01-12 <dave at tiredofit dot ca>

   ### Added
      - Update to support new tiredofit/debian base image


## 3.3.1 2019-12-15 <dave at tiredofit dot ca>

   ### Changed
      - Remove ENABLE_SMALL_FILES option


## 3.3.0 2019-12-15 <dave at tiredofit dot ca>

   ### Added
      - MongoDB 4.2.2

   ### Changed
      - Switch to tiredoft/debian:buster as base due to Alpine compilation/licensing issues


## 3.2.2 2019-06-09 <dave at tiredofit dot ca>

* Fix ENABLE_SMALLFILES environment variable

## 3.2.1 2019-04-27 <dave at tiredofit dot ca>

* Fix startup script

## 3.2 2019-04-27 <dave at tiredofit dot ca>

* Add ENABLE _REPLICATION

## 3.1 2019-04-20 <dave at tiredofit dot ca>

* Use mongodb packages from tiredofit/mongo-builder due to Alpine removing from package repository

## 3.0 2019-01-14 <dave at tiredofit dot ca>

* Refactored image to support environment variables and a more usable startup process.

## 2.2 2019-01-14 <dave at tiredofit dot ca>

* Split into seperate versions

## 2.1 2017-12-01 <dave at tiredofit dot ca>

* Base bump to Alpine 3.7

## 2.0 2017-07-22 <dave at tiredofit dot ca>

* Rebase Alpine w/s6
* Zabbix

## 1.0 2017-03-03 <dave at tiredofit dot ca>

* Initial Build
