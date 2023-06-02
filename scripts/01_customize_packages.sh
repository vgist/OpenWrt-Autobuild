#!/bin/bash

# create directory
[[ ! -d package/new ]] && mkdir -p package/new

# Access Control
cp -rf ../immortalwrt-luci/applications/luci-app-accesscontrol package/new/

# arpbind
cp -rf ../immortalwrt-luci/applications/luci-app-arpbind package/new/

# AutoCore
cp -rf ../autocore package/new/

# automount
cp -rf ../immortalwrt/package/emortal/automount package/new/
# backport ntfs3 patches
curl -sSL https://github.com/immortalwrt/immortalwrt/commit/2d32c19.patch | patch -p1

# cpufreq
cp -rf ../immortalwrt-luci/applications/luci-app-cpufreq package/new/

# DDNS
cp -rf ../immortalwrt-packages/net/ddns-scripts_{aliyun,dnspod} package/new/

# dnsmasq: add filter aaa option
cp -rf ../patches/910-add-filter-aaaa-option-support.patch package/network/services/dnsmasq/patches/
patch -p1 -i ../patches/dnsmasq-add-filter-aaaa-option.patch
patch -d feeds/luci -p1 -i ../../../patches/filter-aaaa-luci.patch

# Filetransfer
cp -rf ../immortalwrt-luci/applications/luci-app-filetransfer package/new/
cp -rf ../immortalwrt-luci/libs/luci-lib-fs package/new/

# FullCone
cp -rf ../immortalwrt/package/network/utils/fullconenat package/network/utils
cp -f ../immortalwrt/target/linux/generic/hack-5.4/952-net-conntrack-events-support-multiple-registrant.patch target/linux/generic/hack-5.4/
patch -d feeds/luci -p1 -i ../../../patches/fullconenat-luci.patch
cp -rf ../immortalwrt/package/network/config/firewall/patches package/network/config/firewall/

# mbedtls
cp -f ../immortalwrt/package/libs/mbedtls/patches/100-Implements-AES-and-GCM-with-ARMv8-Crypto-Extensions.patch package/libs/mbedtls/patches/
cp -f ../patches/201-Camellia-block-cipher.patch package/libs/mbedtls/patches/

# OLED
svn export -q https://github.com/NateLol/luci-app-oled/trunk package/new/luci-app-oled

# OpenClash
svn export -q https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/new/luci-app-openclash
# add kmod-inet-diag package
curl -sSL https://github.com/openwrt/openwrt/commit/efc8aff.patch | patch -p1

# Realtek R8125, RTL8152/8153, RTL8192EU
cp -rf ../immortalwrt/package/kernel/{r8125,r8152,rtl8192eu} package/new/

# Release Ram
cp -rf ../immortalwrt-luci/applications/luci-app-ramfree package/new/

# Scheduled Reboot
cp -rf ../immortalwrt-luci/applications/luci-app-autoreboot package/new/

# ShadowsocksR Plus+
svn export -q https://github.com/fw876/helloworld/trunk package/helloworld
svn export -q https://github.com/coolsnowwolf/packages/trunk/net/shadowsocks-libev package/helloworld/shadowsocks-libev
rm -rf ./feeds/packages/net/{xray-core,shadowsocks-libev}
# require by xray-core
rm -rf ./feeds/packages/lang/golang
svn export -q https://github.com/openwrt/packages/branches/openwrt-22.03/lang/golang feeds/packages/lang/golang
# building ssr-libev with libmbedtls
patch -d package/helloworld -p1 -i ../../../patches/building-ssr-libev-with-libmbedtls.patch

# Traffic Usage Monitor
svn export -q https://github.com/brvphoenix/wrtbwmon/trunk/wrtbwmon package/new/wrtbwmon
svn export -q https://github.com/brvphoenix/luci-app-wrtbwmon/trunk/luci-app-wrtbwmon package/new/luci-app-wrtbwmon

# USB Printer
cp -rf ../immortalwrt-luci/applications/luci-app-usb-printer package/new/

# vlmcsd
cp -rf ../immortalwrt-luci/applications/luci-app-vlmcsd package/new/
cp -rf ../immortalwrt-packages/net/vlmcsd package/new/

# Wechat push
svn export -q https://github.com/tty228/luci-app-wechatpush/trunk package/new/luci-app-wechatpush

# xlnetacc
cp -rf ../immortalwrt-luci/applications/luci-app-xlnetacc package/new/

# Zerotier
cp -rf ../immortalwrt-luci/applications/luci-app-zerotier package/new/

# default settings and translation
cp -rf ../default-settings package/new/

# nf conntrack
sed -i 's,16384,65536,g' package/kernel/linux/files/sysctl-nf-conntrack.conf
echo "net.netfilter.nf_conntrack_helper=1" >> package/kernel/linux/files/sysctl-nf-conntrack.conf
echo "net.netfilter.nf_conntrack_buckets=16384" >> package/kernel/linux/files/sysctl-nf-conntrack.conf
echo "net.netfilter.nf_conntrack_expect_max=16384" >> package/kernel/linux/files/sysctl-nf-conntrack.conf

# fix include luci.mk
find package/new/ -type f -name Makefile -exec sed -i 's,../../luci.mk,$(TOPDIR)/feeds/luci/luci.mk,g' {} +
