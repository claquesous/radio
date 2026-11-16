# Claqradio Configuration files

This repo contains configuration files to run your very own instance of the not so world famous Claqradio.

## Prerequisites

You must have icecast and [Liquidsoap](https://www.liquidsoap.info/) 2.4.6 installed. Debian's and Ubuntu's own packages are older, so install the `.deb` matching your distro from the [upstream release](https://github.com/savonet/liquidsoap/releases/tag/v2.4.6) (`ocaml4.14.2` build). Liquidsoap is driven by the [ClaqRadio Stream Manager](https://github.com/claquesous/radio-stream-manager), which runs one Liquidsoap process per stream; see that repo for its script and build instructions.

Liquidsoap is the recommended encoder. The older ices setup is kept in [`ices/`](#ices-legacy) but is no longer maintained.

## Included files

### Systemctl services

- claqradio-backend.service
- claqradio-frontend.service
- systemd/radio-stream-manager.service

If you have systemctl, these can be added to automatically start your nextjs frontend server, rails backend server and the stream manager, which streams to your icecast service.

See systemctl manuals to determine how to install and enable these services.

### Stream manager config

- stream-manager.yaml

A sample config for the stream manager. Most keys can also be set by environment variable; see the stream manager's README.

### nginx config

- claqradio.nginx.conf

An example nginx config.

## ices (legacy)

The `ices/` directory holds the previous setup, which ran ices v0.4 with a Perl module instead of Liquidsoap. It needs perl, ices v0.4 (with liblame support if you want to reencode to a standard bitrate) and the URI and JSON perl modules. See this [guide](https://ardsite.medium.com/internet-radio-server-with-icecast2-and-ices-mp3-stream-42a20e2d4713) for help installing dependencies on an Ubuntu system.

- ices/claqradio.service: a systemctl service running ices directly.
- ices/claqradio.conf.sample: a sample ices config file which should be modified to match your icecast configuration. The service assumes this will be available in `/etc/ices` without `.sample`.
- ices/ClaqRadio.pm: the Perl module ices uses to fetch each song from your instance of [ClaqRadio Backend](https://github.com/claquesous/radio-backend). The service assumes this will be available in `/etc/ices/modules`.
