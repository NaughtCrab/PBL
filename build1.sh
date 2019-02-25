#!/bin/bash

# Time function, ms 
function gettime() 
{
	t=$1
	#echo t = $t
	sec=${t%.*}
	#echo second is $sec
	#echo t = $t
	n_sec=${t##*.}
	#echo nsecond is $n_sec
	t1=$(($sec*1000+$n_sec/1000000))
	echo $t1
	return $t1
}

# Set up connection to host1#

# Container building
sudo -S docker run -d --name test1 alpine /bin/sh -c 'i=0; while true; do echo $i; i=$(expr $i + 1); sleep 1; done' << EOF
pbl
EOF

# Set timestamp 1: Container running
tp1=$(date +%s.%N)
timestamp_1=$(gettime $tp1)
echo -en $timestamp_1'\t' >> logs_1.txt
echo Timestamp 1 is $timestamp_1

# Build checkpoint
sudo docker checkpoint create --checkpoint-dir=/tmp test1 checkpoint1
results=$(sudo docker inspect -f '{{.Id}}' test1)
echo ">>Checkpoint finish<<"

# Set timestamp 2: Finish Checkpoint
tp2=$(date +%s.%N)
timestamp_2=$(gettime $tp2)
echo -en $timestamp_1'\n' >> logs_1.txt
echo Timestamp 2 is $timestamp_2

# T2 - T1 = Tc -> time to build checkpoint
# Send the checkpoint to host2
sudo sshpass -p "pbl" scp -o StrictHostKeyChecking=no -r /tmp/checkpoint1 pbl@172.31.52.150:/tmp
echo ">>succeed VM1<<"





