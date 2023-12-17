# Use an official base image
FROM ubuntu:20.04

# Install dependencies
RUN apt update && apt install -y vim nginx \

# Expose a port to the host machine
EXPOSE 80
RUM echo "ciao it was built on $(date)" >/usr/share/nginx/html/index.html

