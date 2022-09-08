#!/bin/bash

set -ex

# Allow chips that support 11ac to use 256QAM on 2.4GHz
cp -rf ../immortalwrt/package/kernel/mt76/patches package/kernel/mt76/

source ./01_customize_packages.sh

exit 0
