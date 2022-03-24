#!/bin/bash

# Access Control
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-accesscontrol feeds/luci/applications/luci-app-accesscontrol
ln -sf ../../../feeds/luci/applications/luci-app-accesscontrol ./package/feeds/luci/luci-app-accesscontrol

# ADBYBY Plus +
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-adbyby-plus feeds/luci/applications/luci-app-adbyby-plus
ln -sf ../../../feeds/luci/applications/luci-app-adbyby-plus ./package/feeds/luci/luci-app-adbyby-plus
svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/adbyby package/new/adbyby

# arpbind
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-arpbind feeds/luci/applications/luci-app-arpbind
ln -sf ../../../feeds/luci/applications/luci-app-arpbind ./package/feeds/luci/luci-app-arpbind

# AutoCore
cp -rv ../immortalwrt/package/emortal/autocore package/new/autocore

# automount
cp -rv ../immortalwrt/package/emortal/automount package/new/automount

# cpufreq
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-cpufreq feeds/luci/applications/luci-app-cpufreq
ln -sf ../../../feeds/luci/applications/luci-app-cpufreq ./package/feeds/luci/luci-app-cpufreq

# DDNS
svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/ddns-scripts_aliyun package/new/ddns-scripts_aliyun
svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/ddns-scripts_dnspod package/new/ddns-scripts_dnspod

# Filetransfer
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-filetransfer feeds/luci/applications/luci-app-filetransfer
ln -sf ../../../feeds/luci/applications/luci-app-filetransfer ./package/feeds/luci/luci-app-filetransfer
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/libs/luci-lib-fs feeds/luci/libs/luci-lib-fs
ln -sf ../../../feeds/luci/libs/luci-lib-fs ./package/feeds/luci/luci-lib-fs

# FullCone
cp -rv ../immortalwrt/package/kernel/fullconenat package/network/fullconenat
cp -v ../immortalwrt/target/linux/generic/hack-5.4/952-net-conntrack-events-support-multiple-registrant.patch target/linux/generic/hack-5.4/
patch -d feeds/luci -p1 -i ../../../patches/fullconenat-luci.patch
cp -rv ../immortalwrt/package/network/config/firewall/patches package/network/config/firewall/

# IPSEC
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-ipsec-vpnd feeds/luci/applications/luci-app-ipsec-vpnd
ln -sf ../../../feeds/luci/applications/luci-app-ipsec-vpnd ./package/feeds/luci/luci-app-ipsec-vpnd

# OLED
git clone -b master --depth 1 --single-branch https://github.com/NateLol/luci-app-oled package/new/luci-app-oled

# OpenAppFilter
git clone -b master --depth 1 --single-branch https://github.com/destan19/OpenAppFilter package/new/OpenAppFilter

# OpenClash
git clone -b master --depth 1 --single-branch https://github.com/vernesong/OpenClash package/new/luci-app-openclash
wget -qO - https://github.com/openwrt/openwrt/commit/efc8aff.patch | patch -p1

# Realtek RTL8811CU/RTL8821CU
cp -rv ../immortalwrt/package/kernel/rtl8821cu package/new/rtl8821cu

# Realtek RTL8812AU/21AU
cp -rv ../immortalwrt/package/kernel/rtl8812au-ac package/new/rtl8812au-ac

# Realtek 8812BU/8822BU
cp -rv ../immortalwrt/package/kernel/rtl88x2bu package/new/rtl88x2bu

# Release Ram
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-ramfree feeds/luci/applications/luci-app-ramfree
ln -sf ../../../feeds/luci/applications/luci-app-ramfree ./package/feeds/luci/luci-app-ramfree

# Scheduled Reboot
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-autoreboot feeds/luci/applications/luci-app-autoreboot
ln -sf ../../../feeds/luci/applications/luci-app-autoreboot ./package/feeds/luci/luci-app-autoreboot

# SeverChan
git clone -b master --depth 1 --single-branch https://github.com/tty228/luci-app-serverchan package/new/luci-app-serverchan

# ShadowsocksR Plus+
rm -rf ./feeds/packages/net/kcptun
rm -rf ./feeds/packages/net/xray-core
rm -rf ./feeds/packages/net/shadowsocks-libev
svn export https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus package/new/luci-app-ssr-plus
svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/dns2socks package/new/dns2socks
svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/ipt2socks package/new/ipt2socks
svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/kcptun package/new/kcptun
svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/microsocks package/new/microsocks
svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/pdnsd-alt package/new/pdnsd-alt
svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/redsocks2 package/new/redsocks2
svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/shadowsocks-libev package/new/shadowsocks-libev
svn export https://github.com/fw876/helloworld/trunk/naiveproxy package/new/naiveproxy
svn export https://github.com/fw876/helloworld/trunk/shadowsocks-rust package/new/shadowsocks-rust
svn export https://github.com/fw876/helloworld/trunk/shadowsocksr-libev package/new/shadowsocksr-libev
svn export https://github.com/fw876/helloworld/trunk/simple-obfs package/new/simple-obfs
svn export https://github.com/fw876/helloworld/trunk/tcping package/new/tcping
svn export https://github.com/fw876/helloworld/trunk/trojan package/new/trojan
svn export https://github.com/fw876/helloworld/trunk/v2ray-plugin package/new/v2ray-plugin
svn export https://github.com/fw876/helloworld/trunk/xray-core package/new/xray-core
# building ssr-libev with libmbedtls
patch -d package/new -p1 -i ../../../patches/building-ssr-libev-with-libmbedtls.patch

# Traffic Usage Monitor
git clone -b master --depth 1 --single-branch https://github.com/brvphoenix/wrtbwmon package/new/wrtbwmon
git clone -b master --depth 1 --single-branch https://github.com/brvphoenix/luci-app-wrtbwmon package/new/luci-app-wrtbwmon

# upx & ucl
svn export https://github.com/coolsnowwolf/lede/trunk/tools/ucl tools/ucl
svn export https://github.com/coolsnowwolf/lede/trunk/tools/upx tools/upx
sed -i '/builddir dependencies/i\tools-y += ucl upx' tools/Makefile
sed -i '/builddir dependencies/a\$(curdir)/upx/compile := $(curdir)/ucl/compile' tools/Makefile

# USB Printer
svn export https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-usb-printer feeds/luci/applications/luci-app-usb-printer
ln -sf ../../../feeds/luci/applications/luci-app-usb-printer ./package/feeds/luci/luci-app-usb-printer

# vlmcsd
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-vlmcsd feeds/luci/applications/luci-app-vlmcsd
ln -sf ../../../feeds/luci/applications/luci-app-vlmcsd ./package/feeds/luci/luci-app-vlmcsd
svn export https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/vlmcsd package/new/vlmcsd

# xlnetacc
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-xlnetacc feeds/luci/applications/luci-app-xlnetacc
ln -sf ../../../feeds/luci/applications/luci-app-xlnetacc ./package/feeds/luci/luci-app-xlnetacc

# Zerotier
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-zerotier feeds/luci/applications/luci-app-zerotier
ln -sf ../../../feeds/luci/applications/luci-app-zerotier ./package/feeds/luci/luci-app-zerotier

# default settings and translation
cp -rv ../default-settings package/new/learn-translate

# max conntrack
sed -i 's,16384,65536,g' package/kernel/linux/files/sysctl-nf-conntrack.conf

exit 0
