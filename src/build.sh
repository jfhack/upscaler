#!/bin/bash

# to build using cuda check this:
# https://stackoverflow.com/a/61737404/2913839
# https://stackoverflow.com/a/75629058/2913839

if [ -f "/etc/nv_tegra_release" ]; then
    echo "Building for Jetson/ARM"
    DOCKER_BUILDKIT=0 docker build -t ghcr.io/jfhack/upscaler:latest -f Dockerfile.jetson .
else
    echo "Building for x86-64"
    DOCKER_BUILDKIT=0 docker build -t ghcr.io/jfhack/upscaler:latest .
fi
