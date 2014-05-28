## Nginx Dockerfile


This repository contains **Dockerfile** of [Nginx](http://nginx.org/) with authentication
configured as a proxy for [ElasticSearch](http://www.elasticsearch.org/)


### Dependencies

* [dockerfile/ubuntu](http://dockerfile.github.io/#/ubuntu)


### Installation

1. Install tools for setting up users
  sudo apt-get install -y apache2-utils

2. Setup directories
  sudo mkdir -p /var/www/es
  sudo mkdir -p /var/log/nginx

3. Install [Docker](https://www.docker.io/).

4. Build an image from Dockerfile:
  docker build -t="jbasdf/nginx_es" github.com/jbasdf/nginx_es


### Usage

    docker run -d -p 80:80 jbasdf/nginx_es

#### Attach persistent/shared directories

    docker run -d -p 80:80 --link elasticsearch:elasticsearch -v /var/log/nginx:/var/log/nginx -v /var/www/es:/var/www/es -v /var/www/es_public:/var/www/es_public jbasdf/nginx_es

#### Authorize users

  # Add tools
  sudo apt-get install -y apache2-utils

  # Setup directories
  sudo mkdir -p /var/www/es
  sudo mkdir -p /var/www/es_public

  # Add a public user.
  sudo htpasswd -c /var/www/es_public/.htpasswd my_public_user_name

  # Add an admin user.
  sudo htpasswd -c /var/www/es/.htpasswd my_admin_user_name


Open `http://<host>` to see the welcome page.

