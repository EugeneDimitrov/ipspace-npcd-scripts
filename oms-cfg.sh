#!/bin/sh
wget https://raw.githubusercontent.com/EugeneDimitrov/ipspace-npcd-scripts/main/95-omsagent.conf
sudo chown omsagent:omiusers 95-omsagent.conf
sudo chmod 644 95-omsagent.conf
sudo mv 95-omsagent.conf /etc/rsyslog.d/
