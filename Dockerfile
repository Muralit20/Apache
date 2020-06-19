FROM ubuntu:latest

RUN apt-get update 

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install apache2

ARG ARG_APACHE_LISTEN_PORT=8080

ENV APACHE_LISTEN_PORT=${ARG_APACHE_LISTEN_PORT}

RUN sed -s -i -e "s/80/${APACHE_LISTEN_PORT}/" /etc/apache2/sites-enabled/000-default.conf /etc/apache2/ports.conf

CMD apache2 restart

WORKDIR /var/jenkins_home/workspace/apache

CMD cp index.html /var/www/html

CMD /usr/sbin/apache2ctl -D FOREGROUND

