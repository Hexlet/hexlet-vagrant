FROM       ubuntu:trusty
MAINTAINER mokevnin

# ENV HOME /root

CMD ["/usr/bin/supervisord"]

RUN apt-get update

RUN apt-get install -y build-essential

RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor

RUN apt-get install -y python-software-properties
RUN apt-get install -y software-properties-common

RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -y nodejs
RUN npm install -g tty.js

EXPOSE 8080

ONBUILD COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf