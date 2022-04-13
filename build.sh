#!/bin/zsh

docker buildx build --progress=plain --push --platform "linux/arm/v7,linux/arm64,linux/amd64" --tag dylangmiles/docker-laravel-grunt:latest .




