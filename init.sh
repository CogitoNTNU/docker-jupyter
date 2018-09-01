sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install nginx zip

sudo rm /var/www/html/*
sudo systemctl restart nginx

if [ "$1" = "gpu" ]; then
	touch etc/gpu
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	sudo add-apt-repository -y ppa:graphics-drivers/ppa

	curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
	  sudo apt-key add -
	distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
	curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
	  sudo tee /etc/apt/sources.list.d/nvidia-docker.list

	sudo apt-get update

	sudo apt-get install -y docker-ce nvidia-384

	sudo apt-get install -y -f nvidia-docker2
	sudo pkill -SIGHUP dockerd

	sudo docker build . -f Dockerfile_gpu -t jupyter
else
	sudo apt-get -y install docker.io
	sudo docker build . -f Dockerfile_cpu -t jupyter
fi
