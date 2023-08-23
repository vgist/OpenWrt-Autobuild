#!/bin/bash

set -ex

# cpu operating points
cp -f ../patches/320-sun8i-h3-add-more-cpu-operating-points.patch ./target/linux/sunxi/patches-5.15/

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
