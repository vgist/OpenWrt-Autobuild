#!/bin/bash

# blob drivers for mt7615
# Lean
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/mt package/new/mt
sed -i 's|kmod-mt7615e kmod-mt7615-firmware|-luci-newapi -wpad-openssl kmod-mt7615d_dbdc wireless-tools|g' target/linux/ramips/image/mt7621.mk
# Lienol
#svn co https://github.com/Lienol/openwrt/trunk/package/lean/MTK7615-DBDC-LINUX5.4 package/new/mt
wget -P feeds/luci/modules/luci-base/htdocs/luci-static/resources/icons/ https://github.com/coolsnowwolf/luci/raw/master/modules/luci-base/htdocs/luci-static/resources/icons/wifi_big.png
wget -P feeds/luci/modules/luci-base/htdocs/luci-static/resources/icons/ https://github.com/coolsnowwolf/luci/raw/master/modules/luci-base/htdocs/luci-static/resources/icons/wifi_big_disabled.png

# patch for mt76
#svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/kernel/mt76/patches package/kernel/mt76/patches

# mbedtls
cp -f ../patches/201-Camellia-block-cipher.patch package/libs/mbedtls/patches/

exit 0
