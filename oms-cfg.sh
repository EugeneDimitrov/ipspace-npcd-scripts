#!/bin/sh
wget https://raw.githubusercontent.com/EugeneDimitrov/ipspace-npcd-scripts/main/95-omsagent.conf
chown omsagent:omiusers 95-omsagent.conf
chmod 644 95-omsagent.conf
mv 95-omsagent.conf /etc/rsyslog.d/
