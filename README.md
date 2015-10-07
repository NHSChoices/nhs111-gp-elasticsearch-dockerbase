## Elasticsearch Dockerfile


This repository contains **Dockerfile** of [Elasticsearch](http://www.elasticsearch.org/) for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/dockerfile/elasticsearch/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).


### Base Docker Image

* [dockerfile/java:oracle-java8](http://dockerfile.github.io/#/java)


### Installation

1. Install [Docker](https://www.docker.com/).

2. Build an image from Dockerfile: `docker build -t nhs111beta/gpelasticsearch "<dockerimagelocation>"`)


### Usage

    docker run -t --privileged -p 9200:9200 -p 9300:9300 nhs111beta/gpelasticsearch


After few seconds, open `http://<host>:9200` to see the result.
