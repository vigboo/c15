#!/bin/bash

ip route del default
ip route add default via $GATEWAY_IP || true

# Run scenario if present and optionally schedule via cron
#Каждую минуту: * * * * *
#Каждые 5 минут: */5 * * * *
if [ -f /opt/scenario.sh ]; then
    echo "Adding scenario ot crontab tasks"
    chmod +x /opt/scenario.sh
    echo "*/${SCENARIO_PERIOD} * * * * /opt/scenario.sh" > /etc/crontabs/root
    chmod 0600 /etc/crontabs/root
    crond -l 8 -f &
fi

sleep infinity
