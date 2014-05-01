## Nginx Dockerfile


This repository contains **Dockerfile** of [Nginx](http://nginx.org/) with authentication
configured as a proxy for [ElasticSearch](http://www.elasticsearch.org/)


### Dependencies

* [dockerfile/java](http://dockerfile.github.io/#/java)


### Installation

1. Install tools for setting up users
  sudo apt-get install -y apache2-utils

2. Setup directories
  sudo mkdir -p /var/www/es
  sudo mkdir -p /var/log/nginx

3. Add a user. You'll be prompted for a password
  sudo htpasswd -c /var/www/es/.htpasswd username

4. Install [Docker](https://www.docker.io/).

5. Build an image from Dockerfile:
  docker build -t="jbasdf/nginx_es" github.com/jbasdf/nginx_es


### Usage

    docker run -d -p 80:80 jbasdf/nginx_es

#### Attach persistent/shared directories

    docker run -d -p 80:80 --link elasticsearch:elasticsearch -v /var/log/nginx:/var/log/nginx -v /var/www/es:/var/www/es jbasdf/nginx_es


Open `http://<host>` to see the welcome page.

