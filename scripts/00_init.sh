#!/usr/bin/env bash

set -ex


__get_other-repos() {
    git clone -b master --depth 1 --single-branch https://github.com/coolsnowwolf/lede lede
    git clone -b master --depth 1 --single-branch https://github.com/immortalwrt/immortalwrt immortalwrt
    git clone -b master --depth 1 --single-branch https://github.com/immortalwrt/packages immortalwrt-packages
    git clone -b master --depth 1 --single-branch https://github.com/immortalwrt/luci immortalwrt-luci
    echo "src-git nikki https://github.com/nikkinikki-org/OpenWrt-nikki.git;main" >> ./openwrt/feeds.conf.default
}

__patch_fullconenat() {
    # patch kernel
    cp -f ./lede/target/linux/generic/hack-6.12/952-add-net-conntrack-events-support-multiple-registrant.patch ./openwrt/target/linux/generic/hack-6.12/
    # disable KERNEL_WERROR
    sed -i 's,imply KERNEL_WERROR,#imply KERNEL_WERROR,g' ./openwrt/toolchain/gcc/Config.version
    # fullconenat-nft
    cp -rf ./immortalwrt/package/network/utils/fullconenat-nft ./openwrt/package/network/utils/
    # libnftnl
    rm -rf ./openwrt/package/libs/libnftnl
    cp -rf ./immortalwrt/package/libs/libnftnl ./openwrt/package/libs/
    # nftables
    rm -rf ./openwrt/package/network/utils/nftables/
    cp -rf ./immortalwrt/package/network/utils/nftables ./openwrt/package/network/utils/
    # firewall4
    rm -rf ./openwrt/package/network/config/firewall4
    cp -rf ./immortalwrt/package/network/config/firewall4 ./openwrt/package/network/config/
    # patch luci
    patch -d ./openwrt/feeds/luci -p1 -i ../../../patches/fullconenat-luci.patch
}

case $1 in
    other-repos)        __get_other-repos   ;;
    patch-fullconenat)  __patch_fullconenat ;;
    *)                  echo "input error"  ;;
esac

exit 0
