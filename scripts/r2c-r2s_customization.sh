#!/bin/bash

set -ex

# crypto optimization
sed -i 's,-mcpu=generic,-mcpu=cortex-a53+crypto,g' include/target.mk

# Necessary patches from immortalwrt
pushd ../immortalwrt
git revert ca9bda5da7 --no-edit
popd
rm -rf ./target/linux/rockchip/{image,patches-5.10}
cp -rf ../immortalwrt/target/linux/rockchip/{files,image,patches-5.10} target/linux/rockchip/
rm -rf ./package/boot/uboot-rockchip
cp -rf ../immortalwrt/package/boot/{uboot-rockchip,arm-trusted-firmware-rockchip-vendor} package/boot/

# fix net
sed -i '/friendlyarm,nanopi-r2s/i\friendlyarm,nanopi-r2c|\\' target/linux/rockchip/armv8/base-files/etc/board.d/01_leds
sed -i '/friendlyarm,nanopi-r2s/i\\tfriendlyarm,nanopi-r2c|\\' target/linux/rockchip/armv8/base-files/etc/board.d/02_network
sed -i '/friendlyarm,nanopi-r2s/i\friendlyarm,nanopi-r2c|\\' target/linux/rockchip/armv8/base-files/etc/hotplug.d/net/40-net-smp-affinity


# model name patch for aarch64
cp -f ../immortalwrt/target/linux/generic/hack-5.10/312-arm64-cpuinfo-Add-model-name-in-proc-cpuinfo-for-64bit-ta.patch target/linux/generic/hack-5.10/

echo '
CONFIG_MOTORCOMM_PHY=y
CONFIG_ARM_RK3328_DMC_DEVFREQ=y
CONFIG_ARM64_CRYPTO=y
CONFIG_CRYPTO_AES_ARM64=y
CONFIG_CRYPTO_AES_ARM64_CE=y
CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
CONFIG_CRYPTO_CRCT10DIF_ARM64_CE=y
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_GHASH_ARM64_CE=y
CONFIG_CRYPTO_SIMD=y
' >> ./target/linux/rockchip/armv8/config-5.10

source ./01_customize_packages.sh

exit 0
