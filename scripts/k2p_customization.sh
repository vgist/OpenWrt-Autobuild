#!/bin/bash

# drivers for mt7615
#svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/mt package/new/mt
svn co https://github.com/Lienol/openwrt/trunk/package/lean/MTK7615-DBDC-LINUX5.4 package/new/mt
wget -P feeds/luci/modules/luci-base/htdocs/luci-static/resources/icons/ https://github.com/coolsnowwolf/luci/raw/master/modules/luci-base/htdocs/luci-static/resources/icons/wifi_big.png
wget -P feeds/luci/modules/luci-base/htdocs/luci-static/resources/icons/ https://github.com/coolsnowwolf/luci/raw/master/modules/luci-base/htdocs/luci-static/resources/icons/wifi_big_disabled.png

exit 0
