#!/bin/bash

# feed update
./scripts/feeds update -a && ./scripts/feeds install -a

# access control
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-accesscontrol package/new/luci-app-accesscontrol
# DDNS
rm -rf ./feeds/packages/net/ddns-scripts
rm -rf ./feeds/luci/applications/luci-app-ddns
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ddns-scripts_aliyun package/new/ddns-scripts_aliyun
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ddns-scripts_dnspod package/new/ddns-scripts_dnspod
svn co https://github.com/openwrt/packages/branches/openwrt-18.06/net/ddns-scripts feeds/packages/net/ddns-scripts
svn co https://github.com/openwrt/luci/branches/openwrt-18.06/applications/luci-app-ddns feeds/luci/applications/luci-app-ddns
# FullCone
svn co https://github.com/Lienol/openwrt/trunk/package/network/fullconenat package/network/fullconenat
pushd target/linux/generic/hack-4.14
wget https://raw.githubusercontent.com/Lienol/openwrt/19.07/target/linux/generic/hack-4.14/952-net-conntrack-events-support-multiple-registrant.patch
popd
pushd feeds/luci
wget -O- https://github.com/LGA1150/fullconenat-fw3-patch/raw/master/luci.patch | git apply
popd
mkdir -p package/network/config/firewall/patches
wget -P package/network/config/firewall/patches/ https://raw.githubusercontent.com/Lienol/openwrt/19.07/package/network/config/firewall/patches/fullconenat.patch
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
# Scheduled Reboot
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-autoreboot package/new/luci-app-autoreboot
# Traffic Usage Monitor
git clone -b master --single-branch https://github.com/brvphoenix/wrtbwmon package/new/wrtbwmon
git clone -b master --single-branch https://github.com/brvphoenix/luci-app-wrtbwmon package/new/luci-app-wrtbwmon
# UPNP
rm -rf ./feeds/packages/net/miniupnpd
svn co https://github.com/coolsnowwolf/packages/trunk/net/miniupnpd feeds/packages/net/miniupnpd
# USB Printer
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-usb-printer package/new/luci-app-usb-printer
# vlmcsd
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/vlmcsd package/new/vlmcsd
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-vlmcsd package/new/luci-app-vlmcsd
# zram-swap
rm -rf package/system/zram-swap
svn co https://github.com/openwrt/openwrt/trunk/package/system/zram-swap package/system/zram-swap

# default settings and translate
svn co https://github.com/vgist/OpenWrt-Packages/trunk/default-settings package/new/lean-translate

exit 0
