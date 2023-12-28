#!/bin/bash

# create directory
[[ ! -d package/new ]] && mkdir -p package/new

# Access Control
cp -rf ../immortalwrt-luci/applications/luci-app-accesscontrol package/new/

# arpbind
cp -rf ../immortalwrt-luci/applications/luci-app-arpbind package/new/

# AutoCore
cp -rf ../immortalwrt/package/emortal/autocore package/new/
cp -rf ../immortalwrt/package/utils/mhz package/utils/
rm -rf feeds/luci/modules/luci-base
cp -rf ../immortalwrt-luci/modules/luci-base feeds/luci/modules
rm -rf feeds/luci/modules/luci-mod-status
cp -rf ../immortalwrt-luci/modules/luci-mod-status feeds/luci/modules/

# automount
cp -rf ../lede/package/lean/automount package/new/
cp -rf ../lede/package/lean/ntfs3-mount package/new/

# cpufreq
cp -rf ../immortalwrt-luci/applications/luci-app-cpufreq package/new/

# dnsmasq
rm -rf package/network/services/dnsmasq
cp -rf ../immortalwrt/package/network/services/dnsmasq package/network/services/

# mbedtls
rm -rf ./package/libs/mbedtls
cp -rf ../immortalwrt/package/libs/mbedtls package/libs/

# OLED
svn export -q https://github.com/NateLol/luci-app-oled/trunk package/new/luci-app-oled

# OpenClash
svn export -q https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/new/luci-app-openclash

# Realtek RTL8125/8125B/8126A
svn export -q https://github.com/sbwml/package_kernel_r8125/trunk package/new/r8125

# Realtek RTL8152/8153, RTL8192EU
cp -rf ../immortalwrt/package/kernel/{r8152,rtl8192eu} package/new/

# Release Ram
cp -rf ../immortalwrt-luci/applications/luci-app-ramfree package/new/

# Scheduled Reboot
cp -rf ../immortalwrt-luci/applications/luci-app-autoreboot package/new/

# ShadowsocksR Plus+
#svn export -q https://github.com/fw876/helloworld/trunk package/helloworld
#svn export -q https://github.com/coolsnowwolf/packages/trunk/net/shadowsocks-libev package/helloworld/shadowsocks-libev
#rm -rf ./feeds/packages/net/{xray-core,shadowsocks-libev}

# USB Printer
cp -rf ../immortalwrt-luci/applications/luci-app-usb-printer package/new/

# vlmcsd
cp -rf ../immortalwrt-luci/applications/luci-app-vlmcsd package/new/
cp -rf ../immortalwrt-packages/net/vlmcsd package/new/

# Zerotier
cp -rf ../immortalwrt-luci/applications/luci-app-zerotier package/new/

# default settings and translation
cp -rf ../default-settings package/new/

# fix include luci.mk
find package/new/ -type f -name Makefile -exec sed -i 's,../../luci.mk,$(TOPDIR)/feeds/luci/luci.mk,g' {} +
