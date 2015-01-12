FROM ubuntu:latest
MAINTAINER ServerMeta <admin@servermeta.net>

# Requirements

RUN apt-get install -y curl git

# Install Nodejs

RUN curl -sL https://deb.nodesource.com/setup | sudo bash -

RUN apt-get update

RUN apt-get install -y nodejs


# Install Meteor

RUN curl -s https://install.meteor.com/ | sudo bash

EXPOSE 3000