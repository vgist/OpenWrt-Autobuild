#!/bin/bash

# patch for mt76
#svn export https://github.com/immortalwrt/immortalwrt/branches/openwrt-21.02/package/kernel/mt76/patches package/kernel/mt76/patches

# mbedtls
cp -f ../patches/201-Camellia-block-cipher.patch package/libs/mbedtls/patches/

exit 0
