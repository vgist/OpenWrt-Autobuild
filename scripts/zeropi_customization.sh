#!/bin/bash

set -ex

# Thermal sensor and cpu operating points
cp -f ../patches/011-ARM-dts-sun8i-h3-add-thermal-sensor-and-zones.patch ./target/linux/sunxi/patches-5.4/
cp -f ../patches/320-sun8i-h3-add-more-cpu-operating-points.patch ./target/linux/sunxi/patches-5.4/

# mbedtls
cp -f ../patches/201-Camellia-block-cipher.patch package/libs/mbedtls/patches/

# crypto
echo '
CONFIG_ARM_MODULE_PLTS=y
CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
CONFIG_SUN8I_THERMAL=y
' >> ./target/linux/sunxi/config-5.4

# Set dhcp proto on lan
echo '
#!/bin/sh

uci del network.lan.ipaddr
uci del network.lan.netmask
uci set network.lan.proto='dhcp'
uci commit network
' >> ./package/base-files/files/etc/uci-defaults/dhcp-proto-lan

exit 0
