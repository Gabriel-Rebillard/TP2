#!/bin/bash

rm ./fifo
mkfifo ./fifo

function execute(){
    echo -e "Bienvenue !\n$(date)"
    while read line;
    do
        echo $(eval "$line")
    done
}

echo "Start."
while true;
do
    nc  -l -s localhost -p 12345 < ./fifo | execute > ./fifo
done