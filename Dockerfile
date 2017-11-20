FROM node:alpine

RUN apk update && \
    apk add tzdata curl bash ca-certificates rsync git
    
RUN mkdir -p /usr/src
WORKDIR /usr/src

COPY start.sh .

RUN npm install -g https://github.com/MegaGM/redis-commander.git && \
    touch /.redis-commander && \
    chgrp -R 0 /.redis-commander && \
    chmod -R g=u /.redis-commander && \
    chmod +x start.sh

CMD ["./start.sh"]

EXPOSE 8081
