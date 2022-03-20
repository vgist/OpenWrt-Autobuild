#!/bin/bash

# patch for mt76
#cp -rv ../immortalwrt/package/kernel/mt76/patches package/kernel/mt76/patches

# mbedtls
cp -v ../patches/201-Camellia-block-cipher.patch package/libs/mbedtls/patches/

exit 0
