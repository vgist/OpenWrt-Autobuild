#!/usr/bin/env bash

set -ex


__get_immortalwrt() {
    git clone -b master --single-branch https://github.com/immortalwrt/immortalwrt immortalwrt
    git clone -b master --depth 1 --single-branch https://github.com/immortalwrt/packages immortalwrt-packages
    git clone -b master --depth 1 --single-branch https://github.com/immortalwrt/luci immortalwrt-luci
}

__init_build_env() {
    sudo -E swapoff -a
    sudo -E rm -f /swapfile
    sudo -E docker image prune -a -f
    sudo -E snap set system refresh.retain=2
    sudo -E apt-get -y purge azure* dotnet* firefox ghc* google* hhvm llvm* mono* mysql* openjdk* php* zulu*
    sudo -E apt-get -y autoremove --purge
    sudo -E rm -rf /usr/share/dotnet /usr/local/lib/android/sdk /etc/mysql /etc/php /usr/local/share/boost
    [ -n "$AGENT_TOOLSDIRECTORY" ] && sudo rm -rf "$AGENT_TOOLSDIRECTORY"
    sudo -E apt-get update -y
    sudo -E apt-get install -y build-essential rsync asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core p7zip p7zip-full msmtp libssl-dev texinfo libreadline-dev libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint ccache curl wget vim nano python3 python3-pip python3-ply haveged lrzsz device-tree-compiler scons
    wget -qO - https://raw.githubusercontent.com/friendlyarm/build-env-on-ubuntu-bionic/master/install.sh | sed 's/python-/python3-/g' | /bin/bash
    pip3 install pyelftools
    sudo -E apt-get clean -y
    git config --global user.name 'GitHub Actions' && git config --global user.email 'noreply@github.com'
    df -h
}

__init_feeds() {
    ./openwrt/scripts/feeds update -a && ./openwrt/scripts/feeds install -a
}


case $1 in
    build_env)      __init_build_env    ;;
    immortalwrt)    __get_immortalwrt   ;;
    feeds)          __init_feeds        ;;
    *)              echo "input error"  ;;
esac

exit 0
