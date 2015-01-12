FROM ubuntu:latest
MAINTAINER ServerMeta <admin@servermeta.net>

# Requirements

RUN  DEBIAN_FRONTEND=noninteractive apt-get update

RUN  DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

RUN  DEBIAN_FRONTEND=noninteractive apt-get install -y curl git nano openssh-server

# Install Nodejs

RUN curl -sL https://deb.nodesource.com/setup | sudo bash -

RUN  DEBIAN_FRONTEND=noninteractive apt-get update

RUN  DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs


# Install Meteor

RUN curl -s https://install.meteor.com/ | sudo bash

# Create Meteor user

RUN useradd -m meteor

# Enable openssh, for sshfs

RUN service ssh start

RUN echo 'meteor:meteor' | chpasswd

# Create test project 

USER meteor

WORKDIR /home/meteor

RUN git clone https://github.com/servermeta/sketeor.git

EXPOSE 3000, 22
