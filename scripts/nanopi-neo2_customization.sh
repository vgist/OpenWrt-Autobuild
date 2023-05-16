#!/bin/bash

set -ex

# kernel
echo '
CONFIG_ARM_MODULE_PLTS=y
CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
' >> ./target/linux/sunxi/config-5.4

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
