#!/bin/bash

read -p "Enter the number of files: " n
read -p "Enter you folder path: " path

mkdir -p "$path"

for i in $(seq 1 $n); do

ext=$(shuf -n1 -e txt log csv sh md)

filename="file${i}.${ext}"

size=$(shuf -n1 -e 10K 100K 500K 1M)

head -c $size /dev/urandom > "$path/$filename"

echo "Created $filename ($size)"

done
