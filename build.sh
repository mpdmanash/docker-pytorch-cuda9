#!/usr/bin/env bash
TAG="latest"

docker build \
    -t pytorch-cuda9:${TAG} .
