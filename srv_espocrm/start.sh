#!/bin/bash

ip route del default
ip route add default via $GATEWAY_IP || true

exec /usr/bin/entrypoint "$@"
