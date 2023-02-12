FROM ubuntu:18.04 as build

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y apt-utils
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \ 
 apt-get dist-upgrade -y



ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y sysvinit-utils

ARG DEBIAN_FRONTEND=noninteractive
RUN dpkg --configure -a

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y nginx 

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y curl

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y systemd
ENTRYPOINT sudo nginx start

COPY my.conf /etc/nginx/
FROM nginx

COPY ./my.conf /etc/nginx/nginx.conf

WORKDIR /etc/nginx/conf.d/
 
VOLUME /Volume/ /var/lib/nginx



CMD ["nginx", "-g", "daemon off;"]
