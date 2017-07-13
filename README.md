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
	
	% docker run -it iris:1.0 bin/bash
	-t : Allocate a pseudo-tty
	-i : Keep STDIN open even if not attached
	
	% vim docker-compose.yml
	
	% docker-compose build
	% docker-compose up
	% docker-compose down
	% docker-compose run web bash

## Instructions

	% docker-compose up
	% docker-compose run app bower install (first run)
	% docker-compose run app bundle install (opt)
	% docker-compose run app npm test
	% docker-compose run app bower install --allow-root
