#!/bin/bash

# Ofast
sed -i 's/Os/Ofast/g' include/target.mk
sed -i 's/O2/Ofast/g' ./rules.mk

# upx ucl patch
wget -O- https://github.com/Lienol/openwrt/commit/af6e1632cd9250c0b4dc47606c1eb92ba4b3ae81.patch | patch -p1

# max conntrack
sed -i 's,16384,65536,g' package/kernel/linux/files/sysctl-nf-conntrack.conf

exit 0
