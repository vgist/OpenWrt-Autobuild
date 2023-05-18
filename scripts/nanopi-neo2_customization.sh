#!/bin/bash

set -ex

rm -rf ./package/boot/{uboot-sunxi,arm-trusted-firmware-sunxi}
cp -rf ../lede/package/boot/{uboot-sunxi,arm-trusted-firmware-sunxi} package/boot/

# model name patch for aarch64
cp -f ../patches/312-arm64-cpuinfo-Add-model-name-in-proc-cpuinfo-for-64bit-ta.patch target/linux/generic/hack-5.10/

# kernel
echo '
CONFIG_ARM_MODULE_PLTS=y
CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
CONFIG_SUN8I_THERMAL=y
# CONFIG_UCLAMP_TASK is not set
CONFIG_ARM64_CRYPTO=y
CONFIG_CRYPTO_AES_ARM64=y
CONFIG_CRYPTO_AES_ARM64_CE=y
CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
CONFIG_CRYPTO_CRCT10DIF_ARM64_CE=y
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_GHASH_ARM64_CE=y
CONFIG_CRYPTO_SHA1_ARM64_CE=y
CONFIG_CRYPTO_SIMD=y
' >> ./target/linux/sunxi/cortexa53/config-5.10

# Set dhcp proto on lan
echo '
#!/bin/sh

uci del network.lan.ipaddr
uci del network.lan.netmask
uci set network.lan.proto='dhcp'
uci commit network
' >> ./package/base-files/files/etc/uci-defaults/dhcp-proto-lan

source ./01_customize_packages.sh

exit 0
