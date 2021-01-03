#!/bin/bash

# Ofast
sed -i 's/Os/Ofast/g' include/target.mk
sed -i 's/O2/Ofast/g' ./rules.mk

# max conntrack
sed -i 's,16384,65536,g' package/kernel/linux/files/sysctl-nf-conntrack.conf

# feed update
./scripts/feeds update -a && ./scripts/feeds install -a

# access control
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-accesscontrol package/new/luci-app-accesscontrol
# automount
rm -rf ./feeds/packages/kernel/exfat-nofuse
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/automount package/new/automount
svn co https://github.com/openwrt/packages/trunk/utils/antfs-mount package/utils/antfs-mount
svn co https://github.com/openwrt/packages/trunk/kernel/antfs package/kernel/antfs
svn co https://github.com/openwrt/openwrt/trunk/package/kernel/exfat package/kernel/exfat
# autosamba
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/autosamba package/new/autosamba
# FullCone
svn co https://github.com/Lienol/openwrt/trunk/package/network/fullconenat package/network/fullconenat
wget -P target/linux/generic/hack-4.14/ https://raw.githubusercontent.com/Lienol/openwrt/19.07/target/linux/generic/hack-4.14/952-net-conntrack-events-support-multiple-registrant.patch
pushd feeds/luci
wget -O- https://github.com/LGA1150/fullconenat-fw3-patch/raw/master/luci.patch | git apply
popd
mkdir -p package/network/config/firewall/patches
wget -P package/network/config/firewall/patches/ https://raw.githubusercontent.com/Lienol/openwrt/19.07/package/network/config/firewall/patches/fullconenat.patch
# PassWall
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/luci-app-passwall package/new/luci-app-passwall
rm -rf ./feeds/packages/net/kcptun
rm -rf ./feeds/packages/net/shadowsocks-libev
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/ipt2socks package/new/ipt2socks
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/ssocks package/new/ssocks
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/microsocks package/new/microsocks
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/pdnsd-alt package/new/pdnsd
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/brook package/new/brook
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/chinadns-ng package/new/chinadns-ng
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/tcping package/new/tcping
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-go package/new/trojan-go
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-plus package/new/trojan-plus
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/dns2socks package/new/dns2socks
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/kcptun package/new/kcptun
svn co https://github.com/Lienol/openwrt-packages/trunk/net/shadowsocks-libev package/new/shadowsocks-libev
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/shadowsocksr-libev package/new/shadowsocksr-libev
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/simple-obfs package/new/simple-obfs
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/v2ray package/new/v2ray
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/xray package/new/xray
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/v2ray-plugin package/new/v2ray-plugin
# Scheduled Reboot
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-autoreboot package/new/luci-app-autoreboot
# Shortcut Forwarding Engine
wget -P target/linux/generic/hack-4.14/ https://raw.githubusercontent.com/Lienol/openwrt/19.07/target/linux/generic/hack-4.14/953-net-patch-linux-kernel-to-support-shortcut-fe.patch
svn co https://github.com/Lienol/openwrt/trunk/package/kernel/shortcut-fe package/kernel/shortcut-fe
#svn co https://github.com/Lienol/openwrt/trunk/package/lean/luci-app-sfe package/new/luci-app-sfe
pushd feeds/luci
cat ../../../files/patches/sfe-luci.patch | git apply
popd
cp -f ../files/patches/shortcut-fe package/base-files/files/etc/init.d/
# Traffic Usage Monitor
git clone -b master --depth 1 --single-branch https://github.com/brvphoenix/wrtbwmon package/new/wrtbwmon
git clone -b master --depth 1 --single-branch https://github.com/brvphoenix/luci-app-wrtbwmon package/new/luci-app-wrtbwmon
# upx & ucl
wget -O- https://github.com/Lienol/openwrt/commit/098e38db6cccd3c9a95ee82a5396d49fe55a4107.patch | patch -p1
# USB Printer
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-usb-printer package/new/luci-app-usb-printer
# vlmcsd
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/vlmcsd package/new/vlmcsd
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-vlmcsd package/new/luci-app-vlmcsd
# zram-swap
rm -rf package/system/zram-swap
svn co https://github.com/openwrt/openwrt/trunk/package/system/zram-swap package/system/zram-swap

# default settings and translate
cp -rf ../default-settings package/new/lean-translate

exit 0
