curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo add-apt-repository -y ppa:graphics-drivers/ppa

sudo apt-get update
sudo apt-get -y upgrade

sudo apt-get install -y docker-ce nginx zip

curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
  sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
  sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update

# Install nvidia-docker2 and reload the Docker daemon configuration
sudo apt-get install -y -f nvidia-docker2
sudo pkill -SIGHUP dockerd

sudo docker build . -t jupyter

sudo apt-get install -y nvidia-driver-390

sudo mv nginx.conf /etc/nginx/sites-enabled/default
sudo rm /var/www/html/*
sudo systemctl restart nginx
