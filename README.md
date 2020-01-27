# My private cloud-services

This repository contains the setup-files for my private cloud services running [Homeassistant](https://www.home-assistant.io/), [Nextcloud](https://nextcloud.com/) and [Traefik](https://docs.traefik.io/).

## Short description of what I do here

I use [Traefik](https://docs.traefik.io/) to run a reverse proxy and a single point of entry into my network from the internet. Traefik supports the micro-service strategy and uses labels in the docker-compose file to configure the routes and so on. Other containers can also use these traefik labels and add container-specific routes to the reverse-proxy. This allows you to start or stop containers at runtime, without stopping the reverse proxy or other services.

In the background, I run [Homeassistant](https://www.home-assistant.io/) and [Nextcloud](https://nextcloud.com/). I would also be able to run more services, but that's what I need :-). See the following chapters on how to configure containers with the existing files.

By the way, find more configurations about Traefik on [their website!](https://docs.traefik.io/)

## Configurations

### Traefik

[Traefik](https://docs.traefik.io/) promotes itself with the following sentences: Traefik is an open-source Edge Router that makes publishing your services a fun and easy experience.
Before starting the service, you need to change the label "traefik.http.middlewares.traefik-auth.basicauth.users=user:passwordInHash" (add custom user and password) and add the proper domain instead of "traefik.yourwebsite.com" (2x) in the docker-compose file. After that, configure the traefik.yml and change the email to your personal email address. Finally, start the container with `docker-compose up -d` in the directory of traefik.

### Nextcloud

[Nextcloud](https://nextcloud.com/) is a open source cloud platform which enables you to run your own, private cloud. I especially used the apache version (with an apache service in the background), because all the other versions caused some issues in my setup. Beside that, a MariaDB service is running to manage all the data of the backend (history, etc.). Before running the docker-compose command, you will need to change the docker-compose.yml file. There are several entries marked with `****` (like users, passwords and volumes). Change it to your needs! After that, also don't forget to add the proper domain instead of "nextcloud.yourwebsite.com" (2x). Run the container in the directory nextcloud with the command `docker-compose up -d`.

### Dynu-Update

Dynu-Update is a self-made (with a specialised Dockerfile) update client for the [Dynu-DDNS Service](https://www.dynu.com/). All you need to configure is the file dynu.sh. Replace the `***` with your credentials of your dynu account. Run the container in the directory dynu-update with the command `docker-compose up -d`.

### Homeassistant

[Homeassistant](https://www.home-assistant.io/) is an open source home automation platform. You first need to change the docker-compose.yml and add the proper domain instead of "homeassistant.yourwebsite.com" (2x). After that, you can configure all the Homeassistant related stuff in the files of the directory configs/. Run the container in the directory homeassistant with the command `docker-compose up -d`.
