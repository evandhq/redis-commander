FROM node

RUN mkdir -p /usr/src
WORKDIR /usr/src

RUN npm install -g https://github.com/MegaGM/redis-commander.git && \
    touch /.redis-commander && \
    chgrp -R 0 /.redis-commander && \
    chmod -R g=u /.redis-commander

CMD "redis-commander --redis-host $REDIS_HOST --redis-port $REDIS_PORT --redis-password $REDIS_PASSWORD --redis-db $REDIS_DB --http-auth-username $HTTP_USERNAME --http-auth-password $HTTP_PASSWORD"

EXPOSE 8081
