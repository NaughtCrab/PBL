# Set up connection to host2#

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

# Create an empty container 
sudo -S docker create --name test1-clone alpine /bin/sh -c 'i=0; while true; do echo $i; i=$(expr $i + 1); sleep 1; done' <<EOF
pbl
EOF

# Confirm the file is received
while($(find /tmp -name checkpoint1))
do
    echo waiting
done

# Set timestamp 3: Receive the checkpoint
tp3=$(date +%s.%N)
timestamp_3=$(gettime $tp3)
echo -en $timestamp_3'\t' >> logs_2.txt
echo Timestamp 3 is $timestamp_3

# T3 - T2 = Tscp -> time to ssh
# Recovery the container
sudo docker start --checkpoint-dir=/tmp --checkpoint=checkpoint1 test1-clone

# Set timestamp 4: Recovery container
tp4=$(date +%s.%N)
timestamp_4=$(gettime $tp4)
echo -en $timestamp_4'\n' >> logs_2.txt
echo Timestamp 4 is $timestamp_4

# T4 - T3 = Tr -> time to recovery 
echo ">>succeed VM2<<"
