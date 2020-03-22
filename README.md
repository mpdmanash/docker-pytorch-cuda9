# docker-pytorch-cuda9

- Install Nvidia Driver in host PC. In my case it is: `nvidia-384`
- Install `nvidia-docker`: It will make the Nvidia driver you installed above accessible to Docker.
- Run `$ ./build.sh` : This is build the Dockerfile and create an image
- Run `$ ./docker-start.sh` : This will run a container daemon from the image created above
- Run `$ ./docker-bash.sh` : This will give you shell access to the container.
- Now inside the container shell, you can check if the setup was successful and if pytorch is able to access the CUDA GPU
    - Run `$ ./miniconda/bin/conda init bash` : This will setup conda ENV
    - Run `$ source ~/.bashrc` : Source that ENV
    - Run `$ python3 -c 'import torch; print(torch.cuda.is_available())'` : If the output is `True`, the installation was successful

### Notes
- I use cuda 9.0 as I am limited by the driver `nvidia-384` as it only supports upto cuda 9.0.
- The base docker image is: `nvidia/cuda:9.0-cudnn7-runtime-ubuntu16.04` from the Docker repository. So `cudnn7` is also installed.
