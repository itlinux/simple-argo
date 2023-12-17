# Pull the minimal Ubuntu image
FROM ubuntu:22.04

# Install Nginx
RUN apt-get -y update && apt-get -y install nginx

# Copy the Nginx config
COPY default.conf /etc/nginx/sites-available/default

# Expose the port for access
EXPOSE 80/tcp

# Echo custom msg for default html page
RUN echo "ciao it was built on $(date)" >/usr/share/nginx/html/index.html

# Run the Nginx server
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]


