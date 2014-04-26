## Nginx Dockerfile


This repository contains **Dockerfile** of [Nginx](http://nginx.org/) configured as a proxy for Elastic Search


### Dependencies

* [dockerfile/ubuntu](http://dockerfile.github.io/#/ubuntu)


### Installation

1. Install [Docker](https://www.docker.io/).

2. Build an image from Dockerfile: `docker build -t="jbasdf/nginx_es" github.com/jbasdf/nginx_es`)


### Usage

    docker run -d -p 80:80 jbasdf/nginx_es

#### Attach persistent/shared directories

    docker run -d -p 80:80 -v <sites-enabled-dir>:/etc/nginx/sites-enabled -v <log-dir>:/var/log/nginx jbasdf/nginx

Open `http://<host>` to see the welcome page.
