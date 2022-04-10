#!/bin/bash

set -ex

# crypto optimization
sed -i 's,-mcpu=generic,-mcpu=cortex-a53+crypto,g' include/target.mk

# Necessary patches from immortalwrt
rm -rf ./target/linux/rockchip/image
cp -rf ../immortalwrt/target/linux/rockchip/image target/linux/rockchip/image
rm -rf ./target/linux/rockchip/patches-5.10
cp -rf ../immortalwrt/target/linux/rockchip/patches-5.10 target/linux/rockchip/patches-5.10
cp -rf ../immortalwrt/target/linux/rockchip/files target/linux/rockchip/files
rm -rf ./package/boot/uboot-rockchip
cp -rf ../immortalwrt/package/boot/uboot-rockchip package/boot/uboot-rockchip
cp -rf ../immortalwrt/package/boot/arm-trusted-firmware-rockchip-vendor package/boot/arm-trusted-firmware-rockchip-vendor

# fix net
sed -i '/friendlyarm,nanopi-r2s/i\friendlyarm,nanopi-r2c|\\' target/linux/rockchip/armv8/base-files/etc/board.d/01_leds
sed -i '/friendlyarm,nanopi-r2s/i\\tfriendlyarm,nanopi-r2c|\\' target/linux/rockchip/armv8/base-files/etc/board.d/02_network
sed -i '/friendlyarm,nanopi-r2s/i\friendlyarm,nanopi-r2c|\\' target/linux/rockchip/armv8/base-files/etc/hotplug.d/net/40-net-smp-affinity


# model name patch for aarch64
cp -f ../immortalwrt/target/linux/generic/hack-5.10/312-arm64-cpuinfo-Add-model-name-in-proc-cpuinfo-for-64bit-ta.patch target/linux/generic/hack-5.10/

# mbedtls
cp -f ../immortalwrt/package/libs/mbedtls/patches/100-Implements-AES-and-GCM-with-ARMv8-Crypto-Extensions.patch package/libs/mbedtls/patches/
cp -f ../patches/201-Camellia-block-cipher.patch package/libs/mbedtls/patches/

echo '
CONFIG_MOTORCOMM_PHY=y
CONFIG_ARM_RK3328_DMC_DEVFREQ=y
' >> ./target/linux/rockchip/armv8/config-5.10

exit 0
