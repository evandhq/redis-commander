#!/bin/bash

redis-commander --redis-host $REDIS_HOST --redis-port $REDIS_PORT --redis-password $REDIS_PASSWORD --redis-db $REDIS_DB --http-auth-username $HTTP_USERNAME --http-auth-password $HTTP_PASSWORD
