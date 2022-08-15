#!/bin/bash

set -ex

# crypto
echo '
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_POLY1305_X86_64=y
' >> ./target/linux/x86/64/config-5.10
# mmc
echo '
CONFIG_MMC_TEST=y
CONFIG_MMC_DEBUG=y
CONFIG_MMC_SDHCI_ACPI=y
CONFIG_MMC_TIFM_SD=y
CONFIG_TIFM_CORE=y
CONFIG_TIFM_7XX1=y
' >> ./target/linux/x86/generic/config-5.10

#passwall
sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' >> feeds.conf.default
sed -i '$a src-git small https://github.com/kenzok8/small' >> feeds.conf.default

source ./01_customize_packages.sh

exit 0
