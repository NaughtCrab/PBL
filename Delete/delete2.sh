#!/bin/bash

sshpass -p "pbl" ssh -o StrictHostKeyChecking=no pbl@172.31.52.150 <<eeooff

sudo -S docker stop test1-clone << EOF
pbl
EOF
sudo docker rm test1-clone
sleep 1
sudo rm -r /tmp/checkpoint1/
sleep 1
sudo rm /home/pbl/build2.sh
eeooff
