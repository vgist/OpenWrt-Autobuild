#!/bin/bash

# feed update
./scripts/feeds update -a && ./scripts/feeds install -a

# Access Control
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-accesscontrol package/new/luci-app-accesscontrol
# AdGuard Home
svn co https://github.com/Lienol/openwrt/trunk/package/diy/luci-app-adguardhome package/new/luci-app-adguardhome
# AutoCore
svn co https://github.com/project-openwrt/openwrt/branches/master/package/lean/autocore package/new/autocore
# arpbind
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-arpbind package/new/luci-app-arpbind
# Filetransfer
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-filetransfer package/new/luci-app-filetransfer
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-lib-fs package/new/luci-lib-fs
# frp, don't build golang binary files
rm -f ./feeds/luci/applications/luci-app-frps
rm -f ./feeds/luci/applications/luci-app-frpc
rm -rf ./feeds/packages/net/frp
rm -f ./package/feeds/packages/frp
git clone -b master --single-branch https://github.com/kuoruan/luci-app-frpc.git package/new/luci-app-frpc
git clone -b master --single-branch https://github.com/lwz322/luci-app-frps.git package/new/luci-app-frps
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/frp package/new/frp
# fullcone
svn co https://github.com/Lienol/openwrt/trunk/package/network/fullconenat package/network/fullconenat
pushd target/linux/generic/hack-4.14
wget https://raw.githubusercontent.com/Lienol/openwrt/19.07/target/linux/generic/hack-4.14/952-net-conntrack-events-support-multiple-registrant.patch
popd
pushd feeds/luci
wget -O- https://github.com/LGA1150/fullconenat-fw3-patch/raw/master/luci.patch | git apply
popd
mkdir -p package/network/config/firewall/patches
wget -P package/network/config/firewall/patches/ https://raw.githubusercontent.com/Lienol/openwrt/19.07/package/network/config/firewall/patches/fullconenat.patch
# DDNS
rm -rf ./feeds/packages/net/ddns-scripts
rm -rf ./feeds/luci/applications/luci-app-ddns
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ddns-scripts_aliyun package/new/ddns-scripts_aliyun
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ddns-scripts_dnspod package/new/ddns-scripts_dnspod
svn co https://github.com/openwrt/packages/branches/openwrt-18.06/net/ddns-scripts feeds/packages/net/ddns-scripts
svn co https://github.com/openwrt/luci/branches/openwrt-18.06/applications/luci-app-ddns feeds/luci/applications/luci-app-ddns
# IPSEC
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-ipsec-vpnd package/new/luci-app-ipsec-vpnd
# NetData
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-netdata package/new/luci-app-netdata
# OpenClash
git clone -b master --single-branch https://github.com/vernesong/OpenClash package/new/luci-app-openclash
rm -rf feeds/packages/libs/libcap
svn co https://github.com/openwrt/packages/trunk/libs/libcap feeds/packages/libs/libcap
# OpenAppFilter
# git clone -b master --single-branch https://github.com/destan19/OpenAppFilter package/new/OpenAppFilter
# PassWall
svn co https://github.com/xiaorouji/openwrt-package/trunk/lienol/luci-app-passwall package/new/luci-app-passwall
rm -rf ./feeds/packages/net/kcptun
rm -rf ./feeds/packages/net/shadowsocks-libev
#svn co https://github.com/xiaorouji/openwrt-package/trunk/package/brook package/new/brook
svn co https://github.com/xiaorouji/openwrt-package/trunk/package/chinadns-ng package/new/chinadns-ng
svn co https://github.com/xiaorouji/openwrt-package/trunk/package/ssocks package/new/ssocks
svn co https://github.com/xiaorouji/openwrt-package/trunk/package/tcping package/new/tcping
#svn co https://github.com/xiaorouji/openwrt-package/trunk/package/trojan-go package/new/trojan-go
svn co https://github.com/xiaorouji/openwrt-package/trunk/package/trojan-plus package/new/trojan-plus
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/dns2socks package/new/dns2socks
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ipt2socks package/new/ipt2socks
#svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/kcptun package/new/kcptun
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/microsocks package/new/microsocks
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/pdnsd-alt package/new/pdnsd
svn co https://github.com/coolsnowwolf/packages/trunk/net/shadowsocks-libev package/new/shadowsocks-libev
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/shadowsocksr-libev package/new/shadowsocksr-libev
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/simple-obfs package/new/simple-obfs
#svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/v2ray package/new/v2ray
#svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/v2ray-plugin package/new/v2ray-plugin
# SeverChan
git clone -b master --single-branch https://github.com/tty228/luci-app-serverchan.git package/new/luci-app-serverchan
# Scheduled Reboot
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-autoreboot package/new/luci-app-autoreboot
# Traffic Usage Monitor
git clone -b master --single-branch https://github.com/brvphoenix/wrtbwmon package/new/wrtbwmon
git clone -b master --single-branch https://github.com/brvphoenix/luci-app-wrtbwmon package/new/luci-app-wrtbwmon
# Unblock Netease Music
git clone -b master --single-branch https://github.com/cnsilvan/luci-app-unblockneteasemusic.git package/new/luci-app-unblockneteasemusic-go
# UPNP
rm -rf ./feeds/packages/net/miniupnpd
svn co https://github.com/coolsnowwolf/packages/trunk/net/miniupnpd feeds/packages/net/miniupnpd
# USB Printer
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-usb-printer package/new/luci-app-usb-printer
# vlmcsd
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/vlmcsd package/new/vlmcsd
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-vlmcsd package/new/luci-app-vlmcsd
# Zerotier
svn co https://github.com/project-openwrt/openwrt/branches/master/package/lean/luci-app-zerotier package/new/luci-app-zerotier
popd
# zram-swap
rm -rf package/system/zram-swap
svn co https://github.com/openwrt/openwrt/trunk/package/system/zram-swap package/system/zram-swap

# default settings and translate
svn co https://github.com/vgist/OpenWrt-Packages/trunk/default-settings package/new/lean-translate

exit 0
