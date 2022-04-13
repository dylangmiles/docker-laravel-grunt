#!/bin/zsh

docker buildx create --use --name build --node build --driver-opt network=host