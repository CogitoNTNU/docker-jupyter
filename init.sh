sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install nginx docker.io zip
sudo mv nginx.conf /etc/nginx/sites-enabled/default
sudo systemctl restart nginx
sudo docker build . -t jupyter
