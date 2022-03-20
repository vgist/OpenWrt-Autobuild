#!/bin/bash

# k3
# only build k3
sed -i 's|^TARGET_|# TARGET_|g; s|# TARGET_DEVICES += phicomm_k3|TARGET_DEVICES += phicomm_k3|' target/linux/bcm53xx/image/Makefile
# k3 device packages
sed -i 's|$(BRCMFMAC_4366C0)|$(IEEE8021X) kmod-brcmfmac k3wifi k3screenctrl|g' target/linux/bcm53xx/image/Makefile
# k3 proprietary wifi driver
svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/k3-brcmfmac4366c-firmware package/k3/k3wifi
# k3 screen
git clone -b master --depth 1 --single-branch https://github.com/lwz322/luci-app-k3screenctrl package/k3/luci-app-k3screenctrl
git clone -b master --depth 1 --single-branch https://github.com/lwz322/k3screenctrl_build package/k3/k3screenctrl_build

# mbedtls
cp -v ../patches/201-Camellia-block-cipher.patch package/libs/mbedtls/patches/

exit 0
