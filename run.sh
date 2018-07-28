#!/bin/bash
echo "Parsing txt files from /data"
find /data -type f -name "*.txt" | while read txt; do
  echo "Processing ${txt}" 
  marblesgen "${txt}"
done

echo "Converting to PNG"
find /data -type f -name "*.svg" | while read svg; do
  name=$(echo "${svg}" | cut -f 1 -d '.')
  echo "Converting ${svg} to png"
  rsvg-convert "${svg}" > "${name}.png"
done