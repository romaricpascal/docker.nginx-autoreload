> This repository is now [hosted on Gitlab](https://gitlab.com/romaricpascal/docker-nginx-autoreload). Please head there if you wish to contribute. Thanks 🙂

nginx-autoreload
================

A Docker container running Nginx and automatically reloading configuration
when file change in /etc/nginx/conf.d

Use:
```
docker build -t <name-of-built-image> .
docker run -p 80 -v </path/on/host>:/etc/nginx/conf.d <name-of-built-image>
```

You can then add/remove/edit configuration files in the volume you mounted and the Nginx server will reload its configuration to take them into account
