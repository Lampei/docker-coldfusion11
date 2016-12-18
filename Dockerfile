FROM phusion/baseimage:0.9.9
MAINTAINER lampei
EXPOSE 80 8500
VOLUME ["/var/www", "/tmp/config"]

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y wget unzip xsltproc apache2
ADD ./build/install/ /tmp/
ADD ./build/service/ /etc/service/
RUN chmod -R 755 /etc/service/coldfusion2016
RUN chmod 755 /tmp/install-cf2016.sh
RUN sudo /tmp/install-cf2016.sh
# RUN cp /tmp/password.properties /opt/coldfusion2016/cfusion/lib/password.properties
# RUN cp /tmp/mod_jk.conf /etc/apache2/mod_jk.conf
# RUN /etc/init.d/apache2 reload
