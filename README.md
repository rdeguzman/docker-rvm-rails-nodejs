# README

## Docker Cheatsheet

  % vim Dockerfile

  % docker build -t iris:1.0 .
  -t : tag an image REPOSITORY:iris TAG:1.0

  % docker build --no-cache=true

  % docker stop $(docker ps -a -q)
  % docker rm $(docker ps -a -q)

  % docker images -f dangling=true -q
  % docker rmi $(docker images -f dangling=true -q)

  % docker run -it datalink/iris bin/bash
  -t : Allocate a pseudo-tty
  -i : Keep STDIN open even if not attached

## Instructions

  % docker build -t iris:master .

  % docker run -it iris:master bin/bash

  % root@xxxx:/usr/local/datalink/iris
