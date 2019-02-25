#!/bin/bash

sleep 2

sshpass -p "pbl" scp -o StrictHostKeyChecking=no ./build1.sh pbl@172.31.52.135:/home/pbl

sshpass -p "pbl" scp -o StrictHostKeyChecking=no ./build2.sh pbl@172.31.52.150:/home/pbl

echo ">> Finish Bash Transmission <<"

sshpass -p "pbl" ssh -o StrictHostKeyChecking=no pbl@172.31.52.135 "./build1.sh"

sshpass -p "pbl" ssh -o StrictHostKeyChecking=no pbl@172.31.52.150 "./build2.sh"

echo ">> Finish Bash excution <<"

sleep 8

sshpass -p "pbl" scp -o StrictHostKeyChecking=no pbl@172.31.52.135:/home/pbl/logs_1.txt ./

sshpass -p "pbl" scp -o StrictHostKeyChecking=no pbl@172.31.52.150:/home/pbl/logs_2.txt ./

printf "%-15s %-15s %-15s %-15s\n" t1 t2 t3 t4 > logs.txt
paste logs_1.txt logs_2.txt >> logs.txt
rm logs_1.txt logs_2.txt

echo ">> Finish download data, Read the log<<"

