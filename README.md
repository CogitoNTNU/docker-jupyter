# docker-jupyter
Automatic setup of jupyter notebooks in docker containers

## Setup
Login and get cudnn download url from https://developer.nvidia.com/rdp/cudnn-download

1. `git clone https://github.com/CogitoNTNU/docker-jupyter.git`
2. `cd docker-jupyter/setup_files`
3. `wget <cudnn_url>`
4. `cd ..`
5. `sudo sh init.sh`
6. `sudo python3 launch.py <number of groups>`
7. `cat passwords.txt`
