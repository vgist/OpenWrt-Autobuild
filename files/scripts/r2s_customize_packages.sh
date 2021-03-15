#!/bin/bash

# crypto optimization
sed -i 's,-mcpu=generic,-march=armv8-a+crypto+crc -mabi=lp64,g' include/target.mk

# Necessary patches from coolsnowwolf/lede
#rm -rf target/linux/rockchip/patches-5.4
#svn co https://github.com/coolsnowwolf/lede/trunk/target/linux/rockchip/patches-5.4 target/linux/rockchip/patches-5.4
pushd target/linux/rockchip/patches-5.4
wget https://raw.githubusercontent.com/coolsnowwolf/lede/master/target/linux/rockchip/patches-5.4/007-arm64-dts-rockchip-Add-RK3328-idle-state.patch
wget https://raw.githubusercontent.com/coolsnowwolf/lede/master/target/linux/rockchip/patches-5.4/008-rockchip-add-hwmon-support-for-SoCs-and-GPUs.patch
wget https://raw.githubusercontent.com/coolsnowwolf/lede/master/target/linux/rockchip/patches-5.4/105-mmc-core-set-initial-signal-voltage-on-power-off.patch
wget https://raw.githubusercontent.com/coolsnowwolf/lede/master/target/linux/rockchip/patches-5.4/201-rockchip-rk3328-add-i2c0-controller-for-nanopi-r2s.patch
wget https://raw.githubusercontent.com/coolsnowwolf/lede/master/target/linux/rockchip/patches-5.4/801-char-add-support-for-rockchip-hardware-random-number.patch
wget https://raw.githubusercontent.com/coolsnowwolf/lede/master/target/linux/rockchip/patches-5.4/802-arm64-dts-rockchip-add-hardware-random-number-genera.patch
wget https://raw.githubusercontent.com/coolsnowwolf/lede/master/target/linux/rockchip/patches-5.4/991-arm64-dts-rockchip-add-more-cpu-operating-points-for.patch
popd
mkdir -p target/linux/rockchip/files/drivers/char/hw_random
wget -P target/linux/rockchip/files/drivers/char/hw_random/ https://raw.githubusercontent.com/coolsnowwolf/lede/master/target/linux/rockchip/files/drivers/char/hw_random/rockchip-rng.c
# model name patch for aarch64
wget -P target/linux/generic/hack-5.4/ https://raw.githubusercontent.com/coolsnowwolf/lede/master/target/linux/generic/hack-5.4/999-display-model-name-in-proc-cpuinfo.patch

# fix source_url
curl https://raw.githubusercontent.com/immortalwrt/immortalwrt/openwrt-21.02/include/download.mk | cat > ./include/download.mk
curl https://raw.githubusercontent.com/immortalwrt/immortalwrt/openwrt-21.02/scripts/download.pl | cat > ./scripts/download.pl

# Access Control
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-accesscontrol package/new/luci-app-accesscontrol
# AdGuard
svn co https://github.com/Lienol/openwrt/branches/main/package/diy/luci-app-adguardhome package/new/luci-app-adguardhome
# arpbind
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-arpbind package/new/luci-app-arpbind
# AutoCore
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/lean/autocore package/new/autocore
# automount
rm -rf ./feeds/packages/kernel/exfat-nofuse
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/automount package/new/automount
svn co https://github.com/openwrt/packages/trunk/utils/antfs-mount package/utils/antfs-mount
svn co https://github.com/openwrt/packages/trunk/kernel/antfs package/kernel/antfs
# cpufreq
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/lean/luci-app-cpufreq package/new/luci-app-cpufreq
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
rm -rf ./feeds/luci/applications/luci-app-frps
rm -rf ./feeds/luci/applications/luci-app-frpc
rm -rf ./feeds/packages/net/frp
rm -rf ./package/feeds/packages/frp
git clone -b master --depth 1 --single-branch https://github.com/kuoruan/luci-app-frpc.git package/new/luci-app-frpc
git clone -b master --depth 1 --single-branch https://github.com/lwz322/luci-app-frps.git package/new/luci-app-frps
#svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/frp package/new/frp
# FullCone
svn co https://github.com/Lienol/openwrt/branches/main/package/network/fullconenat package/network/fullconenat
wget -P target/linux/generic/hack-5.4/ https://raw.githubusercontent.com/Lienol/openwrt/main/target/linux/generic/hack-5.4/952-net-conntrack-events-support-multiple-registrant.patch
pushd feeds/luci
cat ../../../files/patches/fullconenat-luci-master.patch | git apply
popd
mkdir -p package/network/config/firewall/patches
wget -P package/network/config/firewall/patches/ https://raw.githubusercontent.com/Lienol/openwrt/main/package/network/config/firewall/patches/fullconenat.patch
# IPSEC
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-ipsec-vpnd package/new/luci-app-ipsec-vpnd
# mbedtls
rm -rf ./package/libs/mbedtls
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/libs/mbedtls package/libs/mbedtls
# OLED
git clone -b master --depth 1 --single-branch https://github.com/NateLol/luci-app-oled package/new/luci-app-oled
# OpenAppFilter
git clone -b master --depth 1 --single-branch https://github.com/destan19/OpenAppFilter.git package/new/OpenAppFilter
# OpenClash
git clone -b master --depth 1 --single-branch https://github.com/vernesong/OpenClash package/new/luci-app-openclash
# PassWall
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/luci-app-passwall package/new/luci-app-passwall
rm -rf ./feeds/packages/net/kcptun
rm -rf ./feeds/packages/net/shadowsocks-libev
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/ipt2socks package/new/ipt2socks
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/ssocks package/new/ssocks
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/microsocks package/new/microsocks
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/pdnsd-alt package/new/pdnsd
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/brook package/new/brook
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/chinadns-ng package/new/chinadns-ng
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/tcping package/new/tcping
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-go package/new/trojan-go
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-plus package/new/trojan-plus
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/dns2socks package/new/dns2socks
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/kcptun package/new/kcptun
svn co https://github.com/coolsnowwolf/packages/trunk/net/shadowsocks-libev package/new/shadowsocks-libev
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/shadowsocksr-libev package/new/shadowsocksr-libev
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/shadowsocks-rust package/new/shadowsocks-rust
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/simple-obfs package/new/simple-obfs
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/v2ray package/new/v2ray
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/xray package/new/xray
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/v2ray-plugin package/new/v2ray-plugin
# Realtek RTL8811CU/RTL8821CU
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/ctcgfw/rtl8821cu package/new/rtl8821cu
# Realtek RTL8812AU/21AU
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/ctcgfw/rtl8812au-ac package/new/rtl8812au-ac
# Realtek 8812BU/8822BU
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/ctcgfw/rtl88x2bu package/new/rtl88x2bu
# SeverChan
git clone -b master --depth 1 --single-branch https://github.com/tty228/luci-app-serverchan package/new/luci-app-serverchan
# Scheduled Reboot
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-autoreboot package/new/luci-app-autoreboot
# Traffic Usage Monitor
git clone -b master --depth 1 --single-branch https://github.com/brvphoenix/wrtbwmon package/new/wrtbwmon
git clone -b master --depth 1 --single-branch https://github.com/brvphoenix/luci-app-wrtbwmon package/new/luci-app-wrtbwmon
# UPNP
rm -rf ./feeds/packages/net/miniupnpd
svn co https://github.com/coolsnowwolf/packages/trunk/net/miniupnpd feeds/packages/net/miniupnpd
# upx & ucl
svn co https://github.com/coolsnowwolf/lede/trunk/tools/ucl tools/ucl
svn co https://github.com/coolsnowwolf/lede/trunk/tools/upx tools/upx
sed -i '/builddir dependencies/i\tools-y += ucl upx' tools/Makefile
sed -i '/builddir dependencies/a\$(curdir)/upx/compile := $(curdir)/ucl/compile' tools/Makefile
# USB Printer
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-usb-printer package/new/luci-app-usb-printer
# vlmcsd
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/lean/luci-app-vlmcsd package/new/luci-app-vlmcsd
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/vlmcsd package/lean/vlmcsd
# xlnetacc
git clone -b main --depth 1 --single-branch https://github.com/Beginner-Go/luci-app-xlnetacc package/new/luci-app-xlnetacc
# Zerotier
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-zerotier package/new/luci-app-zerotier

# default settings and translation
cp -rf ../default-settings package/new/learn-translate

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
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_GHASH_ARM64_CE=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
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
' >> ./target/linux/rockchip/armv8/config-5.4

exit 0
