#!/usr/bin/env bash

set -ex


__get_openwrt() {
    git clone https://github.com/openwrt/openwrt
}

__get_immortalwrt() {
    git clone -b master --single-branch https://github.com/immortalwrt/immortalwrt immortalwrt
    pushd immortalwrt
    git reset --hard a3c2886
    popd
    git clone -b master --depth 1 --single-branch https://github.com/immortalwrt/packages immortalwrt-packages
    git clone -b master --depth 1 --single-branch https://github.com/immortalwrt/luci immortalwrt-luci
}

__init_build_env() {
    sudo swapoff -a
    sudo rm -rf /etc/apt/sources.list.d/* /usr/share/dotnet /usr/local/lib/android /opt/ghc
    sudo -E apt-get -qq update
    sudo -E apt-get -qq install aria2
    sudo -E wget -P /usr/local/sbin/ https://github.com/HiGarfield/lede-17.01.4-Mod/raw/master/.github/backup/apt-fast
    sudo -E chmod -R 755 /usr/local/sbin/apt-fast
    sudo -E apt-fast -y -qq install build-essential rsync asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch python3 python2.7 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libreadline-dev libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler g++-multilib antlr3 gperf wget ccache curl swig coreutils vim nano python3 python3-pip python3-ply haveged lrzsz scons libpython3-dev
    sudo -E pip3 install pyelftools
    sudo -E apt-get -qq autoremove --purge
    sudo -E apt-get -qq clean
    sudo -E git config --global user.name 'GitHub Actions' && git config --global user.email 'noreply@github.com'
    df -h
}

__init_feeds() {
    ./openwrt/scripts/feeds update -a && ./openwrt/scripts/feeds install -a
}


case $1 in
    build_env)      __init_build_env    ;;
    openwrt)        __get_openwrt       ;;
    immortalwrt)    __get_immortalwrt   ;;
    feeds)          __init_feeds        ;;
    *)              echo "input error"  ;;
esac

exit 0
