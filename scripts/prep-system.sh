#!/bin/bash

sudo apt-get update
PID=$!
wait $PID
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

PID=$!
wait $PID
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
PID=$!
wait $PID
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"