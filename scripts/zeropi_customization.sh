#!/bin/bash

# Kernel patches from armbian
cp ../patches/320-sun8i-h3-add-more-cpu-operating-points-for-zeropi.patch ./target/linux/sunxi/patches-5.4/
#cp ../patches/321-sunxi-h3-add-thermal-sensor-for-zeropi.patch ./target/linux/sunxi/patches-5.4/

# mbedtls
cp -f ../patches/201-Camellia-block-cipher.patch package/libs/mbedtls/patches/

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

# Allow web access
echo '
#!/bin/sh

uci -q get network.wan > /dev/null 2>&1
if [ $? -eq 1 ]; then
    uci add network interface
    uci rename network.@interface[-1]="wan"
    uci set network.@interface[-1].proto="dhcp"
    uci set network.@interface[-1].device="br-lan"
    uci commit network
fi

uci -q get firewall.web > /dev/null 2>&1
if [ $? -eq 1 ]; then
    uci add firewall rule
    uci rename firewall.@rule[-1]="web"
    uci set firewall.@rule[-1].name="web"
    uci set firewall.@rule[-1].target="ACCEPT"
    uci set firewall.@rule[-1].src="wan"
    uci set firewall.@rule[-1].proto="tcp"
    uci set firewall.@rule[-1].dest_port="80"
    uci commit firewall
fi
' >> ./package/base-files/files/etc/uci-defaults/web-access

exit 0
