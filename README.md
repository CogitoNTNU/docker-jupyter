# docker-jupyter
*Automatic setup of jupyter notebooks in docker containers, with tensorflow-gpu support.*

**WARNING**: It is intended to run this on a clean install of Ubuntu 18.04, it will modify and delete items from your system!

Run either gpu or cpu setup and launch either single or multiple notebooks. Use the cpu version if you are not going to use tensorflow or don't have a graphics card in your system. You need to join the nvidia developer program and download cudnn for tensorflow-gpu. Get the download link by starting the download in your browser, go to the browsers download page and pause it. Finally right click and copy download address.

## Setup
`git clone https://github.com/CogitoNTNU/docker-jupyter.git && cd docker-jupyter`

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

## Save
Save your work with `sudo sh zip.sh` and `scp` the zip somewhere safe.
