#!/bin/bash

# 19.07 feed
rm -f ./feeds.conf.default
wget https://raw.githubusercontent.com/openwrt/openwrt/openwrt-19.07/feeds.conf.default
wget -P include/ https://raw.githubusercontent.com/openwrt/openwrt/openwrt-19.07/include/scons.mk

# feed update
./scripts/feeds update -a && ./scripts/feeds install -a

# Necessary patches from coolsnowwolf
#rm -rf target/linux/rockchip/patches-5.4
#svn co https://github.com/coolsnowwolf/lede/trunk/target/linux/rockchip/patches-5.4 target/linux/rockchip/patches-5.4
pushd target/linux/rockchip/patches-5.4
wget https://raw.githubusercontent.com/coolsnowwolf/lede/master/target/linux/rockchip/patches-5.4/002-rockchip-add-hwmon-support-for-SoCs-and-GPUs.patch
wget https://raw.githubusercontent.com/coolsnowwolf/lede/master/target/linux/rockchip/patches-5.4/003-arm64-dts-rockchip-add-more-cpu-operating-points-for.patch
wget https://raw.githubusercontent.com/coolsnowwolf/lede/master/target/linux/rockchip/patches-5.4/005-arm64-dts-rockchip-Add-RK3328-idle-state.patch
wget https://raw.githubusercontent.com/coolsnowwolf/lede/master/target/linux/rockchip/patches-5.4/007-rockchip-rk3328-fix-NanoPi-R2S-GMAC-clock-name.patch
wget https://raw.githubusercontent.com/coolsnowwolf/lede/master/target/linux/rockchip/patches-5.4/104-rockchip-rk3328-add-i2c0-controller-for-nanopi-r2s.patch
wget https://raw.githubusercontent.com/coolsnowwolf/lede/master/target/linux/rockchip/patches-5.4/105-char-add-support-for-rockchip-hardware-random-number.patch
wget https://raw.githubusercontent.com/coolsnowwolf/lede/master/target/linux/rockchip/patches-5.4/106-arm64-dts-rockchip-add-hardware-random-number-genera.patch
wget https://raw.githubusercontent.com/coolsnowwolf/lede/master/target/linux/rockchip/patches-5.4/107-rockchip-enable-hardware-rng-for-NanoPi-R2S.patch
popd

# firewall
rm -rf ./package/network/config/firewall
svn co https://github.com/openwrt/openwrt/branches/openwrt-19.07/package/network/config/firewall package/network/config/firewall
# hwrng
sed -i 's/-f/-f -i/g' feeds/packages/utils/rng-tools/files/rngd.init
sed -i 's/enabled=0/enabled=1/g' feeds/packages/utils/rng-tools/files/rngd.uci_defaults
sed -i 's/urandom/hwrng/g' feeds/packages/utils/rng-tools/files/rngd.uci_defaults
# luci network
patch -p1 < ../files/patches/r2s/luci_network-add-packet-steering.patch
# patch dnsmasq
patch -p1 < ../files/patches/r2s/dnsmasq-add-filter-aaaa-option.patch
patch -p1 < ../files/patches/r2s/luci-add-filter-aaaa-option.patch
cp -f ../files/patches/r2s/900-add-filter-aaaa-option.patch ./package/network/services/dnsmasq/patches/900-add-filter-aaaa-option.patch
# patch jsonc
patch -p1 < ../files/patches/r2s/use_json_object_new_int64.patch

# fix make defconfig warnings
svn co https://github.com/openwrt/openwrt/branches/openwrt-19.07/package/utils/fuse package/utils/fuse
svn co https://github.com/openwrt/openwrt/branches/openwrt-19.07/package/network/services/samba36 package/network/services/samba36
svn co https://github.com/openwrt/openwrt/branches/openwrt-19.07/package/libs/libconfig package/libs/libconfig
svn co https://github.com/openwrt/packages/trunk/libs/nghttp2 package/libs/nghttp2
svn co https://github.com/openwrt/packages/trunk/libs/libcap-ng package/libs/libcap-ng
rm -rf ./feeds/packages/utils/collectd
svn co https://github.com/openwrt/packages/trunk/utils/collectd feeds/packages/utils/collectd

# Access Control
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-accesscontrol package/new/luci-app-accesscontrol
# AdGuard
svn co https://github.com/Lienol/openwrt/trunk/package/diy/luci-app-adguardhome package/new/luci-app-adguardhome
# arpbind
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-arpbind package/new/luci-app-arpbind
# AutoCore
svn co https://github.com/project-openwrt/openwrt/branches/master/package/lean/autocore package/new/autocore
# automount
rm -rf ./feeds/packages/kernel/exfat-nofuse
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/automount package/new/automount
svn co https://github.com/openwrt/packages/trunk/utils/antfs-mount package/utils/antfs-mount
svn co https://github.com/openwrt/packages/trunk/kernel/antfs package/kernel/antfs
# autosamba
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/autosamba package/new/autosamba
# curl
rm -rf ./package/network/utils/curl
svn co https://github.com/openwrt/packages/trunk/net/curl package/network/utils/curl
# cpufreq
svn co https://github.com/project-openwrt/openwrt/branches/master/package/lean/luci-app-cpufreq package/new/luci-app-cpufreq
# DDNS
rm -rf ./feeds/packages/net/ddns-scripts
rm -rf ./feeds/luci/applications/luci-app-ddns
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ddns-scripts_aliyun package/new/ddns-scripts_aliyun
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ddns-scripts_dnspod package/new/ddns-scripts_dnspod
svn co https://github.com/openwrt/packages/branches/openwrt-18.06/net/ddns-scripts feeds/packages/net/ddns-scripts
svn co https://github.com/openwrt/luci/branches/openwrt-18.06/applications/luci-app-ddns feeds/luci/applications/luci-app-ddns
# Filetransfer
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-filetransfer package/new/luci-app-filetransfer
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-lib-fs package/new/luci-lib-fs
# frp
rm -f ./feeds/luci/applications/luci-app-frps
rm -f ./feeds/luci/applications/luci-app-frpc
rm -rf ./feeds/packages/net/frp
rm -f ./package/feeds/packages/frp
git clone -b master --depth 1 --single-branch https://github.com/kuoruan/luci-app-frpc.git package/new/luci-app-frpc
git clone -b master --depth 1 --single-branch https://github.com/lwz322/luci-app-frps.git package/new/luci-app-frps
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/frp package/new/frp
# FullCone
svn co https://github.com/Lienol/openwrt/trunk/package/network/fullconenat package/network/fullconenat
mkdir package/network/config/firewall/patches
wget -P package/network/config/firewall/patches/ https://github.com/LGA1150/fullconenat-fw3-patch/raw/master/fullconenat.patch
pushd feeds/luci
wget -O- https://github.com/LGA1150/fullconenat-fw3-patch/raw/master/luci.patch | git apply
popd
pushd target/linux/generic/hack-5.4
wget https://raw.githubusercontent.com/coolsnowwolf/lede/master/target/linux/generic/hack-5.4/952-net-conntrack-events-support-multiple-registrant.patch
popd
# IPSEC
#svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-ipsec-vpnd package/new/luci-app-ipsec-vpnd
# NetData
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-netdata package/new/luci-app-netdata
# OLED
git clone -b master --depth 1 --single-branch https://github.com/NateLol/luci-app-oled package/new/luci-app-oled
# OpenAppFilter
git clone -b master --depth 1 --single-branch https://github.com/destan19/OpenAppFilter.git package/new/OpenAppFilter
# OpenClash
#svn co https://github.com/vernesong/OpenClash/branches/master/luci-app-openclash package/new/luci-app-openclash
git clone -b master --depth 1 --single-branch https://github.com/vernesong/OpenClash package/new/luci-app-openclash
rm -rf feeds/packages/libs/libcap
svn co https://github.com/openwrt/packages/trunk/libs/libcap feeds/packages/libs/libcap
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
git clone -b master --depth 1 --single-branch https://github.com/tty228/luci-app-serverchan package/new/luci-app-serverchan
svn co https://github.com/openwrt/openwrt/branches/openwrt-19.07/package/network/utils/iputils package/network/utils/iputils
# Scheduled Reboot
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-autoreboot package/new/luci-app-autoreboot
# Traffic Usage Monitor
git clone -b master --depth 1 --single-branch https://github.com/brvphoenix/wrtbwmon package/new/wrtbwmon
git clone -b master --depth 1 --single-branch https://github.com/brvphoenix/luci-app-wrtbwmon package/new/luci-app-wrtbwmon
# Unblock Netease Music
git clone -b master --depth 1 --single-branch https://github.com/cnsilvan/luci-app-unblockneteasemusic.git package/new/luci-app-unblockneteasemusic-go
# UPNP
rm -rf ./feeds/packages/net/miniupnpd
svn co https://github.com/coolsnowwolf/packages/trunk/net/miniupnpd feeds/packages/net/miniupnpd
# USB Printer
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-usb-printer package/new/luci-app-usb-printer
# vlmcsd
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/vlmcsd package/new/vlmcsd
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-vlmcsd package/new/luci-app-vlmcsd
# xlnetacc
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-xlnetacc package/new/luci-app-xlnetacc
# Zerotier
svn co https://github.com/project-openwrt/openwrt/branches/master/package/lean/luci-app-zerotier package/new/luci-app-zerotier
rm -rf ./feeds/packages/net/zerotier/files/etc/init.d/zerotier

# default settings and translation
cp -rf ../default-settings package/new/lean-translate

# crypto
echo '
CONFIG_ARM64_CRYPTO=y
CONFIG_CRYPTO_AES_ARM64=y
CONFIG_CRYPTO_AES_ARM64_BS=y
CONFIG_CRYPTO_AES_ARM64_CE=y
CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
CONFIG_CRYPTO_AES_ARM64_NEON_BLK=y
CONFIG_CRYPTO_CHACHA20=y
CONFIG_CRYPTO_CHACHA20_NEON=y
CONFIG_CRYPTO_CRCT10DIF_ARM64_CE=y
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_DEV_ROCKCHIP=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_GHASH_ARM64_CE=y
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA1_ARM64_CE=y
CONFIG_CRYPTO_SHA256_ARM64=y
CONFIG_CRYPTO_SHA2_ARM64_CE=y
CONFIG_CRYPTO_SHA3_ARM64=y
CONFIG_CRYPTO_SHA512_ARM64=y
# CONFIG_CRYPTO_SHA512_ARM64_CE is not set
CONFIG_CRYPTO_SIMD=y
CONFIG_CRYPTO_SM3_ARM64_CE=y
CONFIG_CRYPTO_SM4_ARM64_CE=y
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_ROCKCHIP=y
' >> ./target/linux/rockchip/armv8/config-5.4

exit 0
