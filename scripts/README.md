# DockerRandomFiles
0 Provision 2 Ubuntu 18.04 VMs
	docker-host-1
	docker-host-2

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
sudo curl --unix-socket /var/run/docker.sock http:/v.1.24/info

If you prefer formatted

sudo curl --unix-socket /var/run/docker.sock http:/v.1.24/info | python3 -mjson.tool

2.2 Update dockerd to accept remote connections
-----------------------------------------------
Step 1 edit sudo nano /lib/systemd/system/docker.service
With ExecStart=/usr/bin/dockerd -H fd:// -H=tcp://0.0.0.0:2375
Step 2 sudo systemctl daemon-reload
Step 3 sudo service docker restart

2.3 Configure network security group to allow traffic on port 2375
------------------------------------------------------------------

2.4 Test from second machine (docker-host-2)
sudo curl http://docker-host-1:2375/v1.24/info | python3 -mjson.tool
sudo curl http://docker-host-1:2375/v1.24/info

