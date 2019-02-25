#!/bin/bash

sshpass -p "pbl" ssh -o StrictHostKeyChecking=no pbl@172.31.52.135  <<eeooff

sudo -S docker rm test1 <<EOF
pbl
EOF
sleep 1
sudo rm -r /tmp/checkpoint1/
sleep 1
sudo rm /home/pbl/build1.sh

eeooff


