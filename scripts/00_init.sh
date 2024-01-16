#!/usr/bin/env bash

set -ex


__get_openwrt() {
    git clone https://github.com/openwrt/openwrt
}

__get_other-repos() {
    git clone -b master --depth 1 --single-branch https://github.com/coolsnowwolf/lede lede
    git clone -b master --depth 1 --single-branch https://github.com/immortalwrt/immortalwrt immortalwrt
    git clone -b master --depth 1 --single-branch https://github.com/immortalwrt/packages immortalwrt-packages
    git clone -b master --depth 1 --single-branch https://github.com/immortalwrt/luci immortalwrt-luci
}

__init_build_env() {
    sudo swapoff -a
    sudo rm -rf /etc/apt/sources.list.d /usr/share/dotnet /usr/local/lib/android /opt/ghc
    sudo -E apt-get -qq update
    sudo -E apt-get -qq install aria2
    sudo -E wget -P /usr/local/sbin/ https://github.com/HiGarfield/lede-17.01.4-Mod/raw/master/.github/backup/apt-fast
    sudo -E chmod -R 755 /usr/local/sbin/apt-fast
    sudo -E apt-fast -y -qq install ack antlr3 aria2 asciidoc autoconf automake autopoint binutils bison btrfs-progs build-essential bzip2 ca-certificates ccache cmake coreutils cpio curl device-tree-compiler fastjar flex g++-multilib gawk gcc-multilib gettext git git-core gperf gzip haveged help2man intltool img2simg jq libc6-dev-i386 libelf-dev libfuse-dev libglib2.0-dev libgmp3-dev libltdl-dev libmpc-dev libmpfr-dev libncurses5-dev libncursesw5-dev libpython3-dev libreadline-dev libssl-dev libtool libz-dev lrzsz mkisofs msmtp nano ninja-build p7zip p7zip-full patch pigz pkgconf python2.7 python3 python3-pip python3-pyelftools python3-setuptools qemu-utils rsync scons squashfs-tools swig tar texinfo uglifyjs unzip upx upx-ucl vim wget xmlto xsltproc xxd xz-utils yasm zip zlib1g-dev zstd
    sudo -E pip3 install pyelftools pylibfdt
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
    other-repos)    __get_other-repos   ;;
    feeds)          __init_feeds        ;;
    *)              echo "input error"  ;;
esac

exit 0
