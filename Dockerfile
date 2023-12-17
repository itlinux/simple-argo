# Use an official base image
FROM ubuntu:22.04

# Install dependencies
RUN apt update && apt install -y nginx

# Expose a port to the host machine
EXPOSE 8080
RUN echo "ciao it was built on $(date)" >/usr/share/nginx/html/index.html

