#!/bin/bash
sed -i "s|<proxy_pass_addr>|$ELASTICSEARCH_PORT|" /etc/nginx/nginx.conf
service nginx start
