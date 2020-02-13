#!/bin/bash

if [[ -z $LISTEN_PORT ]]; then
  LISTEN_PORT=80
fi

if [[ -z $REQUEST_TIMEOUT ]]; then
  REQUEST_TIMEOUT=60
fi

if [[ -z $DOCKER_NAME ]]; then
  DOCKER_NAME=app
fi

if [[ -z $DOCKER_PORT ]]; then
  DOCKER_PORT=3000
fi

sed -i "s/LISTEN_PORT/${LISTEN_PORT}/" /etc/nginx/nginx.conf
sed -i "s/REQUEST_TIMEOUT/${REQUEST_TIMEOUT}/" /etc/nginx/nginx.conf
sed -i "s/DOCKER_NAME/${DOCKER_NAME}/" /etc/nginx/nginx.conf
sed -i "s/DOCKER_PORT/${DOCKER_PORT}/" /etc/nginx/nginx.conf

if [[ $WEBSOCKET_PATH ]]; then
  sed -i "s/#INCLUDE_WEBSOCKET/include/" /etc/nginx/nginx.conf
  sed -i "s/DOCKER_NAME/${DOCKER_NAME}/" /etc/nginx/location_websocket.conf
  sed -i "s/DOCKER_PORT/${DOCKER_PORT}/" /etc/nginx/location_websocket.conf
  sed -i "s#WEBSOCKET_PATH#${WEBSOCKET_PATH}#" /etc/nginx/location_websocket.conf
fi

exec "$@"
