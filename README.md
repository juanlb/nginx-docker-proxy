# Reverse proxy para apps rails

Este docker sirve como proxy reverso para apps rails

Variables de entorno:

* REQUEST_TIMEOUT [`60` default]
* DOCKER_NAME     [`app` default]
* DOCKER_PORT     [`3000` default]
* LISTEN_PORT     [`80` default]

# Websockets

En caso de necesitar websockets, agregar la variable:

* WEBSOCKET_PATH

Cuando la variable está presente, se hace `include` del archivo `location_websocket.conf`

```
    location WEBSOCKET_PATH {
      proxy_pass http://DOCKER_NAME:DOCKER_PORT/WEBSOCKET_PATH;
      proxy_http_version 1.1;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_set_header Host $http_host;
      proxy_set_header Upgrade "websocket";
      proxy_set_header Connection "Upgrade";
    }
```

## El proxy esta configurado así:

```
proxy_pass http://app:3000;
```