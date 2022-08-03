#!/bin/bash

# create directory
[[ ! -d package/new ]] && mkdir -p package/new

# Access Control
cp -rf ../immortalwrt-luci/applications/luci-app-accesscontrol package/new/

# ADBYBY Plus +
svn export -q https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-adbyby-plus package/new/luci-app-adbyby-plus
cp -rf ../immortalwrt-packages/net/adbyby package/new/

# arpbind
cp -rf ../immortalwrt-luci/applications/luci-app-arpbind package/new/

# AutoCore
cp -rf ../immortalwrt/package/emortal/autocore package/new/
# grant getCPUUsage access
sed -i 's|"getTempInfo"|"getTempInfo", "getCPUBench", "getCPUUsage"|g' package/new/autocore/files/generic/luci-mod-status-autocore.json

# automount
for i in "automount" "ntfs3-mount" "ntfs3-oot"; do
    svn export -q https://github.com/coolsnowwolf/lede/trunk/package/lean/$i package/new/$i
done

# cpufreq
cp -rf ../immortalwrt-luci/applications/luci-app-cpufreq package/new/

# DDNS
cp -rf ../immortalwrt-packages/net/ddns-scripts_{aliyun,dnspod} package/new/

# dnsmasq: add filter aaa option
cp -rf ../patches/910-add-filter-aaaa-option-support.patch package/network/services/dnsmasq/patches/
patch -p1 -i ../patches/dnsmasq-add-filter-aaaa-option.patch
patch -d feeds/luci -p1 -i ../../../patches/filter-aaaa-luci.patch

# dnsmasq: use nft ruleset for dns_redirect
patch -p1 -i ../patches/dnsmasq-use-nft-ruleset-for-dns_redirect.patch

# Filetransfer
cp -rf ../immortalwrt-luci/applications/luci-app-filetransfer package/new/
cp -rf ../immortalwrt-luci/libs/luci-lib-fs package/new/

# FullCone nat for nftables
# patch kernel
cp -f ../immortalwrt/target/linux/generic/hack-5.10/952-net-conntrack-events-support-multiple-registrant.patch target/linux/generic/hack-5.10/
# fullconenat-nft
cp -rf ../immortalwrt/package/network/utils/fullconenat-nft package/network/utils/
# patch libnftnl
cp -rf ../immortalwrt/package/libs/libnftnl/patches package/libs/libnftnl/
sed -i '/PKG_INSTALL:=1/i\PKG_FIXUP:=autoreconf' package/libs/libnftnl/Makefile
# patch nftables
cp -f ../immortalwrt/package/network/utils/nftables/patches/002-nftables-add-fullcone-expression-support.patch package/network/utils/nftables/patches/
# patch firewall4
cp -rf ../immortalwrt/package/network/config/firewall4/patches package/network/config/firewall4/
sed -i 's|+kmod-nft-nat +kmod-nft-nat6|+kmod-nft-nat +kmod-nft-nat6 +kmod-nft-fullcone|g' package/network/config/firewall4/Makefile
# patch luci
patch -d feeds/luci -p1 -i ../../../patches/fullconenat-luci.patch

# mbedtls
cp -f ../immortalwrt/package/libs/mbedtls/patches/100-Implements-AES-and-GCM-with-ARMv8-Crypto-Extensions.patch package/libs/mbedtls/patches/
cp -f ../patches/201-Camellia-block-cipher.patch package/libs/mbedtls/patches/

# OLED
svn export -q https://github.com/NateLol/luci-app-oled/trunk package/new/luci-app-oled

# OpenClash
svn export -q https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/new/luci-app-openclash

# Realtek R8125, RTL8152/8153, RTL8811CU/8821CU, RTL8812BU/8822BU, RTL8192EU
cp -rf ../immortalwrt/package/kernel/{r8125,r8152,rtl8821cu,rtl88x2bu,rtl8192eu} package/new/

# Release Ram
cp -rf ../immortalwrt-luci/applications/luci-app-ramfree package/new/

# Scheduled Reboot
cp -rf ../immortalwrt-luci/applications/luci-app-autoreboot package/new/

# SeverChan
svn export -q https://github.com/tty228/luci-app-serverchan/trunk package/new/luci-app-serverchan

# ShadowsocksR Plus+
svn export -q https://github.com/fw876/helloworld/trunk package/helloworld
svn export -q https://github.com/coolsnowwolf/packages/trunk/net/shadowsocks-libev package/helloworld/shadowsocks-libev
rm -rf ./feeds/packages/net/{xray-core,shadowsocks-libev}
cp -rf ../immortalwrt-packages/net/{dns2socks,ipt2socks,microsocks,pdnsd-alt,redsocks2} package/new/
# building ssr-libev with libmbedtls
patch -d package/helloworld -p1 -i ../../../patches/building-ssr-libev-with-libmbedtls.patch

# USB Printer
cp -rf ../immortalwrt-luci/applications/luci-app-usb-printer package/new/

# vlmcsd
cp -rf ../immortalwrt-luci/applications/luci-app-vlmcsd package/new/
cp -rf ../immortalwrt-packages/net/vlmcsd package/new/

# xlnetacc
cp -rf ../immortalwrt-luci/applications/luci-app-xlnetacc package/new/

# Zerotier
cp -rf ../immortalwrt-luci/applications/luci-app-zerotier package/new/

# default settings and translation
cp -rf ../default-settings package/new/

# max conntrack
sed -i 's,16384,65536,g' package/kernel/linux/files/sysctl-nf-conntrack.conf

# need ImmortalWrt mirrors
cp -f ../immortalwrt/scripts/download.pl scripts/
cp -f ../immortalwrt/include/download.mk include/

# fix include luci.mk
find package/new/ -type f -name Makefile -exec sed -i 's,../../luci.mk,$(TOPDIR)/feeds/luci/luci.mk,g' {} +
