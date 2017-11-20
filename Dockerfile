# Simple Dockerfile to execute redis-commander from docker
# build it with like: docker build -t redis-commander .
# to run: docker run -d --name redis-commander -p 8081:8081 redis-commander -- --redis-host your-redis-host
FROM node

RUN mkdir -p /usr/src
WORKDIR /usr/src

RUN git clone https://github.com/MegaGM/redis-commander.git \
	&& cd redis-commander \
	&& npm install -g redis-commander && \
	touch /.redis-commander && \
    	chgrp -R 0 /.redis-commander && \
    	chmod -R g=u /.redis-commander

CMD "redis-commander --redis-host $REDIS_HOST --redis-port $REDIS_PORT --redis-password $REDIS_PASSWORD --redis-db $REDIS_DB --http-auth-username $HTTP_USERNAME --http-auth-password $HTTP_PASSWORD"

EXPOSE 8081
