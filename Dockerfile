FROM ubuntu:latest
MAINTAINER ServerMeta <admin@servermeta.net>

# Requirements

RUN  DEBIAN_FRONTEND=noninteractive apt-get update

RUN  DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

RUN  DEBIAN_FRONTEND=noninteractive apt-get install -y curl git nano openssh-server htop wget supervisor

# Install Nodejs

RUN curl -sL https://deb.nodesource.com/setup | sudo bash -

RUN  DEBIAN_FRONTEND=noninteractive apt-get update

RUN  DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs


# Install Meteor

WORKDIR /home/

RUN curl -s https://install.meteor.com/ | sudo bash

# Create Meteor user

RUN adduser --disabled-password --gecos "" meteor

# Enable openssh, for sshfs

ADD sshd.conf /etc/supervisor/conf.d/sshd.conf

RUN echo 'meteor:meteor' | chpasswd

# Create test project 

USER meteor

RUN git clone https://github.com/servermeta/sketeor.git /home/meteor/sketeor


USER root

EXPOSE 3000
EXPOSE 22
