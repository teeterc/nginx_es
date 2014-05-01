#!/bin/bash
sed -i "s|<proxy_pass_addr>|$DB_PORT_9200_TCP_ADDR:$DB_PORT_9200_TCP_PORT|" /etc/nginx/nginx.conf
nginx
