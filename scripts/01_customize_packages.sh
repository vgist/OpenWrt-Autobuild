#!/bin/bash

# create directory
[[ ! -d package/new ]] && mkdir -p package/new

# Access Control
cp -rf ../immortalwrt-luci/applications/luci-app-accesscontrol package/new/

# arpbind
cp -rf ../immortalwrt-luci/applications/luci-app-arpbind package/new/

# AutoCore
cp -rf ../autocore package/new/
sed -i '/"$threads"/d' package/new/autocore/files/x86/autocore
# grant getCPUUsage access
sed -i 's|"getTempInfo"|"getTempInfo", "getCPUBench", "getCPUUsage"|g' package/new/autocore/files/generic/luci-mod-status-autocore.json

# automount
cp -rf ../lede/package/lean/automount package/new/
cp -rf ../lede/package/lean/ntfs3-mount package/new/
# backport ntfs3 patches
patch -p1 -i ../patches/kernel-add-kmod-fs-ntfs3.patch
cp -rf ../lede/target/linux/generic/files-5.10 target/linux/generic/
cp -f ../lede/target/linux/generic/hack-5.10/996-fs-ntfs3-Add-NTFS3-in-fs-Kconfig-and-fs-Makefile.patch target/linux/generic/hack-5.10/

# cpufreq
cp -rf ../immortalwrt-luci/applications/luci-app-cpufreq package/new/

# dnsmasq
rm -rf package/network/services/dnsmasq
cp -rf ../immortalwrt/package/network/services/dnsmasq package/network/services/

# FullCone nat for nftables
# patch kernel
cp -f ../lede/target/linux/generic/hack-5.10/952-net-conntrack-events-support-multiple-registrant.patch target/linux/generic/hack-5.10/
cp -r ../lede/target/linux/generic/hack-5.10/982-add-bcm-fullconenat-support.patch target/linux/generic/hack-5.10/
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

# mbedtls
rm -rf ./package/libs/mbedtls
cp -rf ../immortalwrt/package/libs/mbedtls package/libs/

# OLED
svn export -q https://github.com/NateLol/luci-app-oled/trunk package/new/luci-app-oled

# OpenClash
svn export -q https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/new/luci-app-openclash

# Realtek RTL8125/8125B/8126A
svn export -q https://github.com/sbwml/package_kernel_r8125/trunk package/new/r8125

# Realtek RTL8192EU
cp -rf ../immortalwrt/package/kernel/rtl8192eu package/new/

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
