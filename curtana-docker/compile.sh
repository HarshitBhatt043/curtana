#!/bin/bash

KERNEL_DIR="$HOME/droidian/kernel/vendor/device"
PACKAGES_DIR="$HOME/droidian/packages"
mkdir -p "$KERNEL_DIR"
mkdir -p "$PACKAGES_DIR"
cd "$KERNEL_DIR"
git clone --depth 1 https://github.com/HarshitBhatt043/curtana.git
mv curtana/* "$KERNEL_DIR"
docker run --rm -v "$PACKAGES_DIR:/buildd" -v "$KERNEL_DIR:/buildd/sources" -it quay.io/droidian/build-essential:trixie-amd64 /bin/bash /buildd/sources/curtana-docker/kernel.sh
