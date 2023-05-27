#!/bin/bash

set -ex

# model name patch for aarch64
cp -f ../patches/312-arm64-cpuinfo-Add-model-name-in-proc-cpuinfo-for-64bit-ta.patch target/linux/generic/hack-5.4/

# sun50i h5 cpufreq patches
curl -sSL https://github.com/immortalwrt/immortalwrt/commit/632c4c9.patch | patch -p1
# thermal patches for sun8i h3 and sun50i h5
curl -sSL https://github.com/immortalwrt/immortalwrt/commit/7fb1b00.patch | patch -p1
# cpufreq for neo2
cp -f ../patches/103-sun50i-h5-add-cpu-opp-refs.patch target/linux/sunxi/patches-5.4

# kernel
echo '
CONFIG_ARM_MODULE_PLTS=y
CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
' >> ./target/linux/sunxi/config-5.4
echo '
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
' >> ./target/linux/sunxi/cortexa53/config-5.4

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
