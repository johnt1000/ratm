#!/bin/bash

clear
echo " >> Docker build..."
# docker build -q --rm -t ruby-ratm .
docker build --rm -t ruby-ratm .
echo " >> Run Rage Against The Machine"
docker run -it --rm ruby-ratm ruby ./lib/console.rb