# README

  % vim Dockerfile

  % docker build -t datalink/iris:1.0 .
  -t : tag an image

  % docker build --no-cache=true

  % docker stop $(docker ps -a -q)
  % docker rm $(docker ps -a -q)

  % docker images -f dangling=true -q
  % docker rmi $(docker images -f dangling=true -q)

  % docker run -it datalink/iris bin/bash
  -t : Allocate a pseudo-tty
  -i : Keep STDIN open even if not attached

