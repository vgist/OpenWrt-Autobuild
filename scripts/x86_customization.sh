#!/bin/bash

set -ex

# crypto
echo '
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_POLY1305_X86_64=y
' >> ./target/linux/x86/64/config-5.10

source ./01_customize_packages.sh

exit 0
