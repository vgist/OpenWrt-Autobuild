#!/bin/bash

set -ex

git clone -b master --depth 1 --single-branch https://github.com/immortalwrt/immortalwrt
git clone -b master --depth 1 --single-branch https://github.com/immortalwrt/packages immortalwrt-packages
git clone -b master --depth 1 --single-branch https://github.com/immortalwrt/luci immortalwrt-luci

exit 0
