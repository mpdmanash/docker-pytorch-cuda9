#!/bin/bash
set -e
apt-get update && apt-get install -y software-properties-common

apt-get install -y wget screen nano gedit git \
bash-completion htop \
build-essential pkg-config ffmpeg libavcodec-dev libavformat-dev libavdevice-dev \
libswscale-dev libusb-1.0-0 libgtkmm-2.4-dev --fix-missing

apt-get -y install python3-tk

wget https://repo.anaconda.com/miniconda/Miniconda3-py37_22.11.1-1-Linux-x86_64.sh 

bash Miniconda3-py37_22.11.1-1-Linux-x86_64.sh -p /miniconda -b

PATH=/miniconda/bin:${PATH}

conda update -y conda

conda install pytorch==1.1.0 torchvision==0.3.0 cudatoolkit=9.0 -c pytorch

python3 -m pip install -U pip
python3 -m pip install -U matplotlib
