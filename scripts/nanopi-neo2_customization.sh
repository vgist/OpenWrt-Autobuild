#!/bin/bash

set -ex

rm -rf ./package/boot/{uboot-sunxi,arm-trusted-firmware-sunxi}
cp -rf ../lede/package/boot/{uboot-sunxi,arm-trusted-firmware-sunxi} package/boot/

# cpufreq
cp -f ../patches/103-sun50i-h5-add-cpu-opp-refs.patch target/linux/sunxi/patches-5.15/
cp -f ../patches/302-sun50i-h5-add-more-cpu-operating-points.patch target/linux/sunxi/patches-5.15/

# model name patch for aarch64
cp -f ../patches/312-arm64-cpuinfo-Add-model-name-in-proc-cpuinfo-for-64bit-ta.patch target/linux/generic/hack-5.15/

# kernel
echo '
CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
# CONFIG_UCLAMP_TASK is not set
' >> ./target/linux/sunxi/config-5.15

# Set dhcp proto on lan
echo '#!/bin/sh

uci -q batch <<-EOF >/dev/null
	delete network.lan.ipaddr
	delete network.lan.netmask
	set network.lan.proto='dhcp'
	commit network
EOF

rm -f /tmp/luci-indexcache
exit 0
' >> ./package/base-files/files/etc/uci-defaults/dhcp-proto-lan

source ./01_customize_packages.sh

exit 0
