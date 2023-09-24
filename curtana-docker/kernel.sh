#!/bin/bash

apt-get install linux-packaging-snippets
cd /buildd/sources
mkdir -p debian/source
cp -v curtana-docker/kernel-info.mk debian/kernel-info.mk
cp -v curtana-docker/curtana_defconfig arch/arm64/configs/curtana_defconfig
echo 13 > debian/compat
echo "3.0 (native)" > debian/source/format
cat > debian/rules <<EOF
#!/usr/bin/make -f

include /usr/share/linux-packaging-snippets/kernel-snippet.mk

%:
	dh \$@
EOF
chmod +x debian/rules
mkdir -p out/KERNEL_OBJ && make ARCH=arm64 O=out/KERNEL_OBJ/ curtana_defconfig && make ARCH=arm64 O=out/KERNEL_OBJ/
rm -f debian/control
debian/rules debian/control
RELENG_HOST_ARCH="arm64" releng-build-package KERNEL_DIR="$HOME/droidian/kernel/vendor/device"
exit
