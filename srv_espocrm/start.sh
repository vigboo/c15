#!/bin/bash

ip route del default
ip route add default via  || true

exec /usr/local/bin/docker-entrypoint.sh apache2-foreground
