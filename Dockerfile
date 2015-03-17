FROM ubuntu:14.04
MAINTAINER Alberto Pérez "alberto.perez.madruga@gmail.com"
ENV RAILS_ENV production
RUN apt-get update
RUN apt-get install -qq -y nodejs
RUN apt-get install -qq -y libmysqlclient-dev
RUN apt-get install -qq -y nginx
RUN apt-get install -qq -y curl
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN \curl -sSL https://get.rvm.io | bash -s stable
RUN gem install unicorn
ADD config/global.conf /etc/nginx/conf.d/
ADD config/nginx.conf /etc/nginx/
RUN mkdir -p /var/www/html

EXPOSE 80
