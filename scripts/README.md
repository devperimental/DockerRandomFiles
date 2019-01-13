# DockerRandomFiles
1 Installing Docker

1.1 prep-system.sh usage
-----------------------
wget -O - https://github.com/devperimental/DockerRandomFiles/raw/master/scripts/prep-system.sh | sudo bash


1.2 install-docker.sh usage
---------------------------
wget -O - https://github.com/devperimental/DockerRandomFiles/raw/master/scripts/install-docker.sh | sudo bash

1.3 test installation
---------------------
sudo docker run hello-world

These steps are taken from Install Docker CE on docs.docker.com
https://docs.docker.com/install/linux/docker-ce/ubuntu/

2 Using the Docker Engine API

2.1 Connect to the engine api on localhost
------------------------------------------
curl --unix-socket /var/run/docker.sock http:/v.1.24/info

2.2 Update dockerd to accept remote connections
-----------------------------------------------
1 edit /lib/systemd/system/docker.service
2 ExecStart=/usr/bin/dockerd -H fd:// -H=tcp://0.0.0.0:2375
3 sudo systemctl daemon-reload
4 sudo service docker restart

2.3 Configure network security group to allow traffic on port 2375
------------------------------------------------------------------

