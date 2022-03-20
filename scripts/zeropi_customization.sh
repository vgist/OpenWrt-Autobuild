#!/bin/bash

# Kernel patches from armbian
cp -v ../patches/320-sun8i-h3-add-more-cpu-operating-points-for-zeropi.patch ./target/linux/sunxi/patches-5.4/
#cp -v ../patches/321-sunxi-h3-add-thermal-sensor-for-zeropi.patch ./target/linux/sunxi/patches-5.4/

# mbedtls
cp -v ../patches/201-Camellia-block-cipher.patch package/libs/mbedtls/patches/

# crypto
echo '
CONFIG_ARM_CRYPTO=y
CONFIG_ARM_MODULE_PLTS=y
CONFIG_CRYPTO_CHACHA20_NEON=y
CONFIG_CRYPTO_POLY1305_ARM=y
CONFIG_CRYPTO_SHA1_ARM=y
CONFIG_CRYPTO_SHA1_ARM_NEON=y
CONFIG_CRYPTO_SHA1_ARM_CE=y
CONFIG_CRYPTO_SHA2_ARM_CE=y
CONFIG_CRYPTO_SHA256_ARM=y
CONFIG_CRYPTO_SHA512_ARM=y
CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL=y
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
' >> ./target/linux/sunxi/cortexa7/config-5.4

# Set dhcp proto on lan
echo '
#!/bin/sh

uci del network.lan.ipaddr
uci del network.lan.netmask
uci set network.lan.proto='dhcp'
uci commit network
' >> ./package/base-files/files/etc/uci-defaults/dhcp-proto-lan

exit 0
