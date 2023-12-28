#!/bin/bash

set -ex

svn export -q https://github.com/coolsnowwolf/lede/trunk/target/linux/meson target/linux/meson

# kernel
echo '
CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
# CONFIG_UCLAMP_TASK is not set
' >> ./target/linux/meson/meson8b/config-6.1

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

# Generate random MAC adress on first boot
echo '#!/bin/sh

MAC=$(printf "%02x" $(( $(hexdump -n1 -e'/1 "0x%02x"' /dev/urandom) & ~1 | 2)) && hexdump -n5 -e'/1 ":%02x"' /dev/urandom)

uci -q batch <<-EOF >/dev/null
	set network.@device[1].macaddr=${MAC}
	commit network
EOF

rm -f /tmp/luci-indexcache
exit 0
' >> ./package/base-files/files/etc/uci-defaults/gen-mac-address

source ./01_customize_packages.sh

exit 0
