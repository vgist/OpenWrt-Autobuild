#!/bin/bash

set -ex

# model name patch
cp -f ../immortalwrt/target/linux/generic/hack-5.4/312-arm64-cpuinfo-Add-model-name-in-proc-cpuinfo-for-64bit-ta.patch target/linux/generic/hack-5.4/

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
