sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install nginx docker.io
sudo mv nginx.conf /etc/nginx/sites-enables/default
sudo systemctl restart nginx
sudo docker build . -t jupyter
