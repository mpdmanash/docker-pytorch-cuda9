# Dockerfile for Packet Picking with CUDA support
# Use nvidia's cuda docker as base
#
FROM nvidia/cuda:9.0-cudnn7-runtime-ubuntu16.04

# setup environment
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

# Configure apt-get to automatically use the best mirror
# ADD sources.list /etc/apt/

# Set the timezone
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# nvidia-docker hooks
LABEL com.nvidia.volumes.needed="nvidia_driver"
ENV PATH /usr/local/nvidia/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}

# install basic tools
COPY ./install-conda-pytorch.sh /
RUN bash -c "chmod +x /install-conda-pytorch.sh"
RUN /install-conda-pytorch.sh