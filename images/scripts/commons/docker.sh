#!/bin/bash

# Install docker
# see https://docs.docker.com/engine/installation/linux/ubuntulinux/

DOCKER_VERSION=1.12.3-0~trusty

echo "installing docker"
DEBIAN_FRONTEND=noninteractive apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list
# update docker repository only
DEBIAN_FRONTEND=noninteractive apt-get -y update -o Dir::Etc::sourcelist="sources.list.d/docker.list" -o Dir::Etc::sourceparts="-" -o APT::Get::List-Cleanup="0"
# DEBIAN_FRONTEND=noninteractive apt-get -y update
DEBIAN_FRONTEND=noninteractive apt-cache policy docker-engine
DEBIAN_FRONTEND=noninteractive apt-get -y install docker-engine=$DOCKER_VERSION
echo "install docker - end"
