#!/bin/bash
for ((i=1;i<=100;i++)); do
touch hieu-$i.txt
echo $i > hieu-$i.txt
date +"%T.%3N" >> hieu-$i.txt
done
