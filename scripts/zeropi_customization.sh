#!/bin/bash

set -ex

# cpu operating points
cp -f ../patches/320-sun8i-h3-add-more-cpu-operating-points.patch ./target/linux/sunxi/patches-5.10/

# kernel
echo '
CONFIG_ARM_MODULE_PLTS=y
CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
# CONFIG_UCLAMP_TASK is not set
' >> ./target/linux/sunxi/config-5.10

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
