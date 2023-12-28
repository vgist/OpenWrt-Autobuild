#!/bin/bash
#

set -ex

# FullCone nat for nftables
# patch kernel
#cp -f ../lede/target/linux/generic/hack-5.15/952-add-net-conntrack-events-support-multiple-registrant.patch target/linux/generic/hack-5.15/
# https://github.com/coolsnowwolf/lede/issues/11211
#sed -i 's|CONFIG_WERROR=y|# CONFIG_WERROR is not set|g' target/linux/generic/config-5.15
curl -sSL https://github.com/coolsnowwolf/lede/files/11473486/952-add-net-conntrack-events-support-multiple-registrant.patch -o target/linux/generic/hack-5.15/952-add-net-conntrack-events-support-multiple-registrant.patch
cp -f ../lede/target/linux/generic/hack-5.15/982-add-bcm-fullconenat-support.patch target/linux/generic/hack-5.15/
# fullconenat-nft
cp -rf ../immortalwrt/package/network/utils/fullconenat-nft package/network/utils/
# libnftnl
rm -rf ./package/libs/libnftnl
cp -rf ../immortalwrt/package/libs/libnftnl package/libs/
# nftables
rm -rf ./package/network/utils/nftables/
cp -rf ../immortalwrt/package/network/utils/nftables package/network/utils/
# firewall4
rm -rf ./package/network/config/firewall4
cp -rf ../immortalwrt/package/network/config/firewall4 package/network/config/
# patch luci
patch -d feeds/luci -p1 -i ../../../patches/fullconenat-luci.patch
