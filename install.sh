UBUNTU_VERSION=20.04
DOCKER_VERSION="5:20.10.4~3-0~ubuntu-focal"

sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get install -y \
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg-agent \
	software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update

apt-cache madison docker-ce

sudo apt-get install -y docker-ce=$DOCKER_VERSION docker-ce-cli=$DOCKER_VERSION containerd.io

sudo service docker start

sudo usermod -aG docker ${USER}

su - ${USER}

sudo service docker status