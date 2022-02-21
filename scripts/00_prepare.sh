#!/bin/bash

set -ex

git clone -b openwrt-21.02 --depth 1 --single-branch https://github.com/immortalwrt/immortalwrt
git clone -b openwrt-21.02 --depth 1 --single-branch https://github.com/immortalwrt/packages immortalwrt-packages
git clone -b openwrt-21.02 --depth 1 --single-branch https://github.com/immortalwrt/luci immortalwrt-luci

exit 0
