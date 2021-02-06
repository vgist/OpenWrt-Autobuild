#!/bin/bash

# max conntrack
sed -i 's,16384,65536,g' package/kernel/linux/files/sysctl-nf-conntrack.conf

# feed update
./scripts/feeds update -a && ./scripts/feeds install -a

# drivers for mt7615
#svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/mt package/new/mt
svn co https://github.com/Lienol/openwrt/branches/19.07/package/lean/mt package/new/mt
echo "/etc/wireless/" >> package/base-files/files/lib/upgrade/keep.d/mtwifi

# access control
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-accesscontrol package/new/luci-app-accesscontrol
# FullCone
svn co https://github.com/Lienol/openwrt/branches/19.07/package/network/fullconenat package/network/fullconenat
wget -P target/linux/generic/hack-4.14/ https://raw.githubusercontent.com/Lienol/openwrt/19.07/target/linux/generic/hack-4.14/952-net-conntrack-events-support-multiple-registrant.patch
pushd feeds/luci
wget -O- https://github.com/LGA1150/fullconenat-fw3-patch/raw/master/luci.patch | git apply
popd
mkdir -p package/network/config/firewall/patches
wget -P package/network/config/firewall/patches/ https://raw.githubusercontent.com/Lienol/openwrt/19.07/package/network/config/firewall/patches/fullconenat.patch
# OpenClash
git clone -b master --depth 1 --single-branch https://github.com/vernesong/OpenClash package/new/luci-app-openclash
rm -rf package/new/luci-app-openclash/luci-app-openclash/root/etc/openclash/Country.mmdb
rm -rf feeds/packages/libs/libcap
svn co https://github.com/openwrt/packages/trunk/libs/libcap feeds/packages/libs/libcap
# Scheduled Reboot
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-autoreboot package/new/luci-app-autoreboot
# Traffic Usage Monitor
git clone -b master --depth 1 --single-branch https://github.com/brvphoenix/wrtbwmon package/new/wrtbwmon
git clone -b master --depth 1 --single-branch https://github.com/brvphoenix/luci-app-wrtbwmon package/new/luci-app-wrtbwmon
# upx & ucl
svn co https://github.com/Lienol/openwrt/branches/19.07/tools/ucl tools/ucl
svn co https://github.com/Lienol/openwrt/branches/19.07/tools/upx tools/upx
sed -i '/builddir dependencies/i\tools-y += ucl upx' tools/Makefile
sed -i '/builddir dependencies/a\$(curdir)/upx/compile := $(curdir)/ucl/compile' tools/Makefile
# vlmcsd
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/vlmcsd package/new/vlmcsd
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-vlmcsd package/new/luci-app-vlmcsd
# Zerotier
svn co https://github.com/project-openwrt/openwrt/branches/openwrt-19.07/package/lean/luci-app-zerotier package/new/luci-app-zerotier
# zram-swap
rm -rf package/system/zram-swap
svn co https://github.com/openwrt/openwrt/trunk/package/system/zram-swap package/system/zram-swap

# default settings and translate
cp -rf ../default-settings package/new/lean-translate

exit 0
