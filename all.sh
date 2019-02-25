#!/bin/bash

./runpy.sh &
./build.sh &

wait
echo ">>All is finish<<"
