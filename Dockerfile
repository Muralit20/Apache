FROM ubuntu:latest

RUN apt-get update 

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install apache2

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

ARG ARG_APACHE_LISTEN_PORT=8080

ENV APACHE_LISTEN_PORT=${ARG_APACHE_LISTEN_PORT}

RUN sed -s -i -e "s/80/${APACHE_LISTEN_PORT}/" /etc/apache2/sites-enabled/000-default.conf /etc/apache2/ports.conf


CMD apache2 restart

COPY index.html /var/ww/html/

CMD /usr/sbin/apache2ctl -D FOREGROUND

EXPOSE ${APACHE_LISTEN_PORT}