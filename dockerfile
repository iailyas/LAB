FROM ubuntu:18.04 

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
#WORKDIR /etc/nginx/
#COPY nginx.conf /etc/nginx/
#COPY nginx.conf /etc/nginx/nginx.conf
#ARG DEBIAN_FRONTEND=noninteractive
#RUN sudo service nginx reload
#RUN sudo service nginx start   
#ENTRYPOINT sudo service nginx start 
 
VOLUME ~/nginx.conf /etc/nginx/conf.d/
#VOLUME /Volume/ /var/lib/nginx

#WORKDIR /etc/nginx/
EXPOSE 8901
#CMD nginx -g daemon off
CMD ["nginx", "-g", "daemon off;"]
