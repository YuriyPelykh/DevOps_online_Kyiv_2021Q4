FROM ubuntu:20.04

ENV TZ=Europe/Kiev
RUN apt-get -y update
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install apache2

RUN echo "Hi there! This is Docker work test" > /var/www/html/index.html
CMD ["/usr/sbin/apache2ctl","-DFOREGROUND"]

EXPOSE 80
