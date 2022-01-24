FROM nginx:1.21
COPY nginx.conf /etc/nginx/nginx.conf
COPY location_websocket.conf /etc/nginx/location_websocket.conf
COPY docker-entrypoint.sh /etc/nginx/docker-entrypoint.sh
ENTRYPOINT ["/etc/nginx/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]