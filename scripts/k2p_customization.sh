#!/bin/bash

set -ex

# Allow chips that support 11ac to use 256QAM on 2.4GHz
cp -rf ../patches/0001-mt76-allow-VHT-rate-on-2.4GHz.patch package/kernel/mt76/patches

source ./01_customize_packages.sh

exit 0
