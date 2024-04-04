# Claqradio Configuration files

This repo contains configuration files to run your very own instance of the not so world famous Claqradio.

## Prerequisites

You must have perl, icecast and ices v0.4 installed. (If you want to reencode to a standard bitrate, you'll need to have included liblame support in ices.) See this [guide](https://ardsite.medium.com/internet-radio-server-with-icecast2-and-ices-mp3-stream-42a20e2d4713) for help installing dependencies on an Ubuntu system.

## Included files

### Systemctl service

- claqradio.service

If you have systemctl, this can be added to automatically start your ices server and mount it to your icecast service.

See systemctl manuals to determine how to install and enable this service.

### ices config

- claqradio.conf.sample

A sample ices config file which should be modified to match your icecast configuration. The service assumes this will be available in `/etc/ices` without `.sample`.

### Perl modules

- ClaqRadio.pm
- ClaqRadio/Config.pm.sample
- ClaqRadio/Ices.pm

Perl modules used by ices to connect to your instance of [ClaqRadio Backend](https://github.com/claquesous/radio-backend). See that repo for more instructions. Update the Config file with your chosen port and remove `.sample`. The service assumes this will be available in `/etc/ices`.

