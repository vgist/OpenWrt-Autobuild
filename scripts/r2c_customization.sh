#!/bin/bash

# crypto optimization
sed -i 's,-mcpu=generic,-mcpu=cortex-a53+crypto,g' include/target.mk

# Necessary patches from immortalwrt
rm -rf ./target/linux/rockchip/image
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/target/linux/rockchip/image target/linux/rockchip/image
rm -rf ./target/linux/rockchip/patches-5.4
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/target/linux/rockchip/patches-5.4 target/linux/rockchip/patches-5.4
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/target/linux/rockchip/files target/linux/rockchip/files
rm -rf ./package/boot/uboot-rockchip
svn co https://github.com/immortalwrt/immortalwrt/branches/master/package/boot/uboot-rockchip package/boot/uboot-rockchip
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/boot/arm-trusted-firmware-rockchip-vendor package/boot/arm-trusted-firmware-rockchip-vendor
# model name patch for aarch64
wget -P target/linux/generic/pending-5.4/ https://raw.githubusercontent.com/immortalwrt/immortalwrt/openwrt-21.02/target/linux/generic/pending-5.4/312-arm64-cpuinfo-Add-model-name-in-proc-cpuinfo-for-64bit-ta.patch

# 40-net-smp-affinity
sed -i 's|friendlyarm,nanopi-r2s|friendlyarm,nanopi-r2c|g' target/linux/rockchip/armv8/base-files/etc/hotplug.d/net/40-net-smp-affinity

# mbedtls
rm -rf ./package/libs/mbedtls
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/libs/mbedtls package/libs/mbedtls

# crypto
echo '
CONFIG_ARM64_CRYPTO=y
CONFIG_CRYPTO_AES_ARM64=y
CONFIG_CRYPTO_AES_ARM64_BS=y
CONFIG_CRYPTO_AES_ARM64_CE=y
CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
CONFIG_CRYPTO_AES_ARM64_NEON_BLK=y
CONFIG_CRYPTO_CHACHA20_NEON=y
CONFIG_CRYPTO_GHASH_ARM64_CE=y
CONFIG_CRYPTO_SHA1_ARM64_CE=y
CONFIG_CRYPTO_SHA2_ARM64_CE=y
CONFIG_CRYPTO_SHA256_ARM64=y
CONFIG_CRYPTO_SHA3_ARM64=y
CONFIG_CRYPTO_SHA512_ARM64=y
# CONFIG_CRYPTO_SHA512_ARM64_CE is not set
CONFIG_CRYPTO_SM3_ARM64_CE=y
CONFIG_CRYPTO_SM4_ARM64_CE=y
CONFIG_MOTORCOMM_PHY=y
' >> ./target/linux/rockchip/armv8/config-5.4

exit 0
