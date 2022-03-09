#!/bin/bash

# Access Control
svn co https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-accesscontrol feeds/luci/applications/luci-app-accesscontrol
ln -sf ../../../feeds/luci/applications/luci-app-accesscontrol ./package/feeds/luci/luci-app-accesscontrol

# AdGuard Home
svn co https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-adguardhome feeds/luci/applications/luci-app-adguardhome
ln -sf ../../../feeds/luci/applications/luci-app-adguardhome ./package/feeds/luci/luci-app-adguardhome

# arpbind
svn co https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-arpbind feeds/luci/applications/luci-app-arpbind
ln -sf ../../../feeds/luci/applications/luci-app-arpbind ./package/feeds/luci/luci-app-arpbind

# AutoCore
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/emortal/autocore package/new/autocore

# automount
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/emortal/automount package/new/automount

# cpufreq
svn co https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-cpufreq feeds/luci/applications/luci-app-cpufreq
ln -sf ../../../feeds/luci/applications/luci-app-cpufreq ./package/feeds/luci/luci-app-cpufreq

# DDNS
svn co https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/ddns-scripts_aliyun package/new/ddns-scripts_aliyun
svn co https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/ddns-scripts_dnspod package/new/ddns-scripts_dnspod

# Filetransfer
svn co https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-filetransfer feeds/luci/applications/luci-app-filetransfer
ln -sf ../../../feeds/luci/applications/luci-app-filetransfer ./package/feeds/luci/luci-app-filetransfer
svn co https://github.com/immortalwrt/luci/branches/openwrt-21.02/libs/luci-lib-fs feeds/luci/libs/luci-lib-fs
ln -sf ../../../feeds/luci/libs/luci-lib-fs ./package/feeds/luci/luci-lib-fs

# FullCone
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/kernel/fullconenat package/network/fullconenat
wget -P target/linux/generic/hack-5.4/ https://github.com/immortalwrt/immortalwrt/raw/openwrt-21.02/target/linux/generic/hack-5.4/952-net-conntrack-events-support-multiple-registrant.patch
patch -d feeds/luci -p1 -i ../../../patches/fullconenat-luci.patch
mkdir -p package/network/config/firewall/patches
wget -P package/network/config/firewall/patches/ https://github.com/immortalwrt/immortalwrt/raw/openwrt-21.02/package/network/config/firewall/patches/fullconenat.patch

# IPSEC
svn co https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-ipsec-vpnd feeds/luci/applications/luci-app-ipsec-vpnd
ln -sf ../../../feeds/luci/applications/luci-app-ipsec-vpnd ./package/feeds/luci/luci-app-ipsec-vpnd

# OLED
git clone -b master --depth 1 --single-branch https://github.com/NateLol/luci-app-oled package/new/luci-app-oled

# OpenAppFilter
git clone -b master --depth 1 --single-branch https://github.com/destan19/OpenAppFilter package/new/OpenAppFilter

# OpenClash
git clone -b master --depth 1 --single-branch https://github.com/vernesong/OpenClash package/new/luci-app-openclash

# Realtek RTL8811CU/RTL8821CU
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/kernel/rtl8821cu package/new/rtl8821cu

# Realtek RTL8812AU/21AU
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/kernel/rtl8812au-ac package/new/rtl8812au-ac

# Realtek 8812BU/8822BU
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/kernel/rtl88x2bu package/new/rtl88x2bu

# Release Ram
svn co https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-ramfree feeds/luci/applications/luci-app-ramfree
ln -sf ../../../feeds/luci/applications/luci-app-ramfree ./package/feeds/luci/luci-app-ramfree

# Scheduled Reboot
svn co https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-autoreboot feeds/luci/applications/luci-app-autoreboot
ln -sf ../../../feeds/luci/applications/luci-app-autoreboot ./package/feeds/luci/luci-app-autoreboot

# SeverChan
git clone -b master --depth 1 --single-branch https://github.com/tty228/luci-app-serverchan package/new/luci-app-serverchan

# ShadowsocksR Plus+
rm -rf ./feeds/packages/net/kcptun
rm -rf ./feeds/packages/net/xray-core
rm -rf ./feeds/packages/net/shadowsocks-libev
svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus package/new/luci-app-ssr-plus
svn co https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/dns2socks package/new/dns2socks
svn co https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/ipt2socks package/new/ipt2socks
svn co https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/kcptun package/new/kcptun
svn co https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/microsocks package/new/microsocks
svn co https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/pdnsd-alt package/new/pdnsd-alt
svn co https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/redsocks2 package/new/redsocks2
svn co https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/shadowsocks-libev package/new/shadowsocks-libev
svn co https://github.com/fw876/helloworld/trunk/naiveproxy package/new/naiveproxy
svn co https://github.com/fw876/helloworld/trunk/shadowsocks-rust package/new/shadowsocks-rust
svn co https://github.com/fw876/helloworld/trunk/shadowsocksr-libev package/new/shadowsocksr-libev
svn co https://github.com/fw876/helloworld/trunk/simple-obfs package/new/simple-obfs
svn co https://github.com/fw876/helloworld/trunk/tcping package/new/tcping
svn co https://github.com/fw876/helloworld/trunk/trojan package/new/trojan
svn co https://github.com/fw876/helloworld/trunk/v2ray-plugin package/new/v2ray-plugin
svn co https://github.com/fw876/helloworld/trunk/xray-core package/new/xray-core
# building ssr-libev with libmbedtls
patch -d package/new -p1 -i ../../../patches/building-ssr-libev-with-libmbedtls.patch

# Traffic Usage Monitor
git clone -b master --depth 1 --single-branch https://github.com/brvphoenix/wrtbwmon package/new/wrtbwmon
git clone -b master --depth 1 --single-branch https://github.com/brvphoenix/luci-app-wrtbwmon package/new/luci-app-wrtbwmon

# upx & ucl
svn co https://github.com/coolsnowwolf/lede/trunk/tools/ucl tools/ucl
svn co https://github.com/coolsnowwolf/lede/trunk/tools/upx tools/upx
sed -i '/builddir dependencies/i\tools-y += ucl upx' tools/Makefile
sed -i '/builddir dependencies/a\$(curdir)/upx/compile := $(curdir)/ucl/compile' tools/Makefile

# USB Printer
svn co https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-usb-printer feeds/luci/applications/luci-app-usb-printer
ln -sf ../../../feeds/luci/applications/luci-app-usb-printer ./package/feeds/luci/luci-app-usb-printer

# vlmcsd
svn co https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-vlmcsd feeds/luci/applications/luci-app-vlmcsd
ln -sf ../../../feeds/luci/applications/luci-app-vlmcsd ./package/feeds/luci/luci-app-vlmcsd
svn co https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/vlmcsd package/new/vlmcsd

# xlnetacc
svn co https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-xlnetacc feeds/luci/applications/luci-app-xlnetacc
ln -sf ../../../feeds/luci/applications/luci-app-xlnetacc ./package/feeds/luci/luci-app-xlnetacc

# Zerotier
svn co https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-zerotier feeds/luci/applications/luci-app-zerotier
ln -sf ../../../feeds/luci/applications/luci-app-zerotier ./package/feeds/luci/luci-app-zerotier

# default settings and translation
cp -rf ../default-settings package/new/learn-translate

# max conntrack
sed -i 's,16384,65536,g' package/kernel/linux/files/sysctl-nf-conntrack.conf

exit 0
