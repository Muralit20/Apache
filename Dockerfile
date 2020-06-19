FROM httpd:2.4.43

ARG ARG_APACHE_LISTEN_PORT=8080

ENV APACHE_LISTEN_PORT=${ARG_APACHE_LISTEN_PORT}

RUN sed -s -i -e "s/80/${APACHE_LISTEN_PORT}/" /usr/local/apache2/conf/httpd.conf /usr/local/apache2/conf/original/httpd.conf

CMD httpd restart

WORKDIR /var/jenkins_home/workspace/apache/

COPY index.html /usr/local/apache2/htdocs

CMD /usr/sbin/apache2ctl -D FOREGROUND

EXPOSE ${APACHE_LISTEN_PORT}
