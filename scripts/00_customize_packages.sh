#!/bin/bash

# Access Control
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-accesscontrol package/new/luci-app-accesscontrol

# Adbyby
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-adbyby-plus package/new/luci-app-adbyby-plus
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/adbyby package/new/adbyby

# AdGuard Home
cp -rf ../luci-app-adguardhome package/new/luci-app-adguardhome

# arpbind
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-arpbind package/new/luci-app-arpbind

# AutoCore
cp -rf ../autocore package/new/autocore

# automount
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/automount package/new/automount

# cpufreq
svn co https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-cpufreq feeds/luci/applications/luci-app-cpufreq
ln -sf ../../../feeds/luci/applications/luci-app-cpufreq ./package/feeds/luci/luci-app-cpufreq

# DDNS
svn co https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/ddns-scripts_aliyun package/new/ddns-scripts_aliyun
svn co https://github.com/immortalwrt/packages/branches/openwrt-21.02/net/ddns-scripts_dnspod package/new/ddns-scripts_dnspod

# Filetransfer
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-filetransfer package/new/luci-app-filetransfer
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-lib-fs package/new/luci-lib-fs

# frp
rm -rf ./feeds/luci/applications/luci-app-frps
rm -rf ./feeds/luci/applications/luci-app-frpc
rm -rf ./feeds/packages/net/frp
rm -rf ./package/feeds/packages/frp
git clone -b master --depth 1 --single-branch https://github.com/kuoruan/luci-app-frpc package/new/luci-app-frpc
git clone -b master --depth 1 --single-branch https://github.com/lwz322/luci-app-frps package/new/luci-app-frps
#svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/frp package/new/frp

# FullCone
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/kernel/fullconenat package/network/fullconenat
wget -P target/linux/generic/hack-5.4/ https://github.com/immortalwrt/immortalwrt/raw/openwrt-21.02/target/linux/generic/hack-5.4/952-net-conntrack-events-support-multiple-registrant.patch
pushd feeds/luci
cat ../../../patches/fullconenat-luci.patch | git apply
popd
mkdir -p package/network/config/firewall/patches
wget -P package/network/config/firewall/patches/ https://github.com/immortalwrt/immortalwrt/raw/openwrt-21.02/package/network/config/firewall/patches/fullconenat.patch

# IPv6 helper
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ipv6-helper package/new/ipv6-helper

# IPSEC
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-ipsec-vpnd package/new/luci-app-ipsec-vpnd
sed -i 's|ifname|device|g' package/new/luci-app-ipsec-vpnd/root/etc/uci-defaults/luci-ipsec

# OLED
git clone -b master --depth 1 --single-branch https://github.com/NateLol/luci-app-oled package/new/luci-app-oled

# OpenAppFilter
git clone -b master --depth 1 --single-branch https://github.com/destan19/OpenAppFilter package/new/OpenAppFilter

# OpenClash
git clone -b master --depth 1 --single-branch https://github.com/vernesong/OpenClash package/new/luci-app-openclash

# PassWall
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/luci-app-passwall package/new/luci-app-passwall
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/brook package/new/brook
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/chinadns-ng package/new/chinadns-ng
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/hysteria package/new/hysteria
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-go package/new/trojan-go
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-plus package/new/trojan-plus
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/v2ray-core package/new/v2ray-core

# Realtek RTL8811CU/RTL8821CU
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/kernel/rtl8821cu package/new/rtl8821cu

# Realtek RTL8812AU/21AU
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/kernel/rtl8812au-ac package/new/rtl8812au-ac

# Realtek 8812BU/8822BU
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/kernel/rtl88x2bu package/new/rtl88x2bu

# Release Ram
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-ramfree package/new/luci-app-ramfree

# Scheduled Reboot
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-autoreboot package/new/luci-app-autoreboot

# SeverChan
git clone -b master --depth 1 --single-branch https://github.com/tty228/luci-app-serverchan package/new/luci-app-serverchan

# ShadowsocksR Plus+
svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus package/new/luci-app-ssr-plus
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/redsocks2 package/new/redsocks2
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/trojan package/new/trojan

# Shared for PassWall and ShadowsocksR Plus+
rm -rf ./feeds/packages/net/kcptun
rm -rf ./feeds/packages/net/xray-core
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/dns2socks package/new/dns2socks
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ipt2socks package/new/ipt2socks
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/microsocks package/new/microsocks
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/pdnsd-alt package/new/pdnsd-alt
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/simple-obfs package/new/simple-obfs
svn co https://github.com/coolsnowwolf/packages/trunk/net/kcptun package/new/kcptun
svn co https://github.com/fw876/helloworld/trunk/naiveproxy package/new/naiveproxy
svn co https://github.com/fw876/helloworld/trunk/tcping package/new/tcping
svn co https://github.com/fw876/helloworld/trunk/v2ray-plugin package/new/v2ray-plugin
svn co https://github.com/fw876/helloworld/trunk/xray-core package/new/xray-core
svn co https://github.com/fw876/helloworld/trunk/shadowsocks-rust package/new/shadowsocks-rust
svn co https://github.com/fw876/helloworld/trunk/shadowsocksr-libev package/new/shadowsocksr-libev

# Traffic Usage Monitor
git clone -b master --depth 1 --single-branch https://github.com/brvphoenix/wrtbwmon package/new/wrtbwmon
git clone -b master --depth 1 --single-branch https://github.com/brvphoenix/luci-app-wrtbwmon package/new/luci-app-wrtbwmon

# UPNP
rm -rf ./feeds/packages/net/miniupnpd
svn co https://github.com/openwrt/packages/trunk/net/miniupnpd feeds/packages/net/miniupnpd

# upx & ucl
svn co https://github.com/coolsnowwolf/lede/trunk/tools/ucl tools/ucl
svn co https://github.com/coolsnowwolf/lede/trunk/tools/upx tools/upx
sed -i '/builddir dependencies/i\tools-y += ucl upx' tools/Makefile
sed -i '/builddir dependencies/a\$(curdir)/upx/compile := $(curdir)/ucl/compile' tools/Makefile

# USB Printer
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-usb-printer package/new/luci-app-usb-printer

# vlmcsd
svn co https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-vlmcsd feeds/luci/applications/luci-app-vlmcsd
ln -sf ../../../feeds/luci/applications/luci-app-vlmcsd ./package/feeds/luci/luci-app-vlmcsd
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/vlmcsd package/new/vlmcsd

# xlnetacc
git clone -b main --depth 1 --single-branch https://github.com/Beginner-Go/luci-app-xlnetacc package/new/luci-app-xlnetacc

# Zerotier
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-zerotier package/new/luci-app-zerotier

# default settings and translation
cp -rf ../default-settings package/new/learn-translate

exit 0
