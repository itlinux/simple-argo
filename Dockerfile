# Use an official base image
FROM ubuntu:latest

# Install dependencies
RUN apt update && apt install -y vim nginx

# Expose a port to the host machine
EXPOSE 8080
RUN echo "ciao it was built on $(date)" >/usr/share/nginx/html/index.html

