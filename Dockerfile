############################################################
# Dockerfile to build Nginx Installed Containers
# Based on nginx image
############################################################


# Set the base image to nginx
FROM iad.ocir.io/ocuocictrng5/nginx:latest

# File Author / Maintainer
MAINTAINER Mahendra Mehra

# Remove the default Nginx configuration file
RUN rm -v /etc/nginx/nginx.conf

# Copy a configuration file from the current directory
ADD nginx.conf /etc/nginx/

RUN mkdir /etc/nginx/logs

# Add a sample index file
ADD index.html /www/data/

# Create a runner script for the entrypoint
COPY runner.sh /runner.sh
RUN chmod +x /runner.sh

# Expose ports
EXPOSE 80

ENTRYPOINT ["/runner.sh"]

# Set the default command to execute
# when creating a new container
CMD ["nginx", "-g", "daemon off;"]
