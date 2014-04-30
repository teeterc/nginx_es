############################################################
#
# Nginx Dockerfile
# Based on Ubuntu
# https://github.com/jbasdf/nginx
# forked from https://github.com/dockerfile/nginx
#
############################################################

# Pull base image.
FROM dockerfile/ubuntu

# Install Nginx.
RUN add-apt-repository -y ppa:nginx/stable
RUN apt-get update
RUN apt-get install -y nano wget dialog net-tools
RUN apt-get install -y nginx

# Remove the default Nginx configuration file
RUN rm -v /etc/nginx/nginx.conf

# Copy a configuration file from the current directory
ADD nginx.conf /etc/nginx/

# Copy startup script
ADD startup.sh /opt/

# Define mountable directories.
VOLUME ["/data", "/etc/nginx/sites-enabled", "/var/log/nginx"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
#ENTRYPOINT ["nginx"]

# Expose ports.
EXPOSE 80

# Run script to modify nginx config and start nginx
#RUN ["setup.sh"]
ENTRYPOINT ["/opt/startup.sh"]