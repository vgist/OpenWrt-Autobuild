#!/bin/bash

set -ex

# patch for mt76
#cp -rf ../immortalwrt/package/kernel/mt76/patches package/kernel/mt76/patches

# mbedtls
cp -f ../patches/201-Camellia-block-cipher.patch package/libs/mbedtls/patches/

exit 0
