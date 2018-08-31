# docker-jupyter
Automatic setup of jupyter notebooks in docker containers

Run either gpu or cpu setup and launch either single or multiple

## Setup
1. `git clone https://github.com/CogitoNTNU/docker-jupyter.git`
2. `cd docker-jupyter`

### GPU
Login and get cudnn download url from https://developer.nvidia.com/rdp/cudnn-download
(cuDNN v7.2.1 Library for Linux, for CUDA 9.0)
1. `cd container/setup/`
2. `wget <cudnn_url>`
3. `cd ../..`
4. `sudo sh init.sh gpu`

### CPU
`sudo sh init.sh`

## Launch
### Single notebook
`sudo sh launch.sh`

### Multiple notebooks
`sudo sh launch.sh <number of notebooks>`
