#!/bin/sh
docker ps -a | grep bsarda/puppetclient | awk '{print $1}' | xargs -n1 docker rm -f
docker rmi bsarda/puppetclient
docker build -t bsarda/puppetclient .
