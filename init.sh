sudo apt-get -y install nginx zip
sudo mv nginx.conf /etc/nginx/sites-enabled/default
sudo rm /var/www/html/*
sudo systemctl restart nginx
sudo docker build . -t jupyter
