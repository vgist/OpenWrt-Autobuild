#!/bin/bash

set -ex

ver="v0.3.1"
curl -L -o ./AmlImg https://github.com/hzyitc/AmlImg/releases/download/$ver/AmlImg_${ver}_linux_amd64
chmod +x ./AmlImg

curl -L -o ./uboot.img https://github.com/hzyitc/u-boot-onecloud/releases/download/build-20221028-0940/eMMC.burn.img
./AmlImg unpack ./uboot.img burn/
echo "::endgroup::"
gunzip -k openwrt/bin/targets/*/*/*.gz
diskimg=$(ls openwrt/bin/targets/*/*/*.img)
loop=$(sudo losetup --find --show --partscan $diskimg)
img_ext="openwrt.img"
img_mnt="xd"
rootfs_mnt="img"
boot_img=$1${img_ext}
boot_img_mnt=$1${img_mnt}
rootfs_img_mnt=$1${rootfs_mnt}
echo ${boot_img}
echo ${boot_img_mnt}
echo ${rootfs_img_mnt}
sudo rm -rf ${boot_img}
sudo rm -rf ${boot_img_mnt}
sudo rm -rf ${rootfs_img_mnt}
sudo dd if=/dev/zero of=${boot_img} bs=1M count=400
sudo mkfs.ext4 ${boot_img}
sudo mkdir ${boot_img_mnt}
sudo mkdir ${rootfs_img_mnt}
sudo mount ${boot_img} ${boot_img_mnt}
sudo mount ${loop}p2 ${rootfs_img_mnt}

pushd ${rootfs_img_mnt}
sudo cp -r * ../${boot_img_mnt}
sudo sync
popd

sudo umount ${boot_img_mnt}
sudo umount ${rootfs_img_mnt}

sudo img2simg ${loop}p1 burn/boot.simg
sudo img2simg openwrt.img burn/rootfs.simg

sudo rm -rf *.img
sudo losetup -d $loop
cat <<EOF >>burn/commands.txt
PARTITION:boot:sparse:boot.simg
PARTITION:rootfs:sparse:rootfs.simg
EOF
prefix=$(ls openwrt/bin/targets/*/*/*.img | sed 's/\.img$//')
burnimg=${prefix}.burn.img
./AmlImg pack $burnimg burn/

for f in openwrt/bin/targets/*/*/*.burn.img; do
    gzip "$f"
done
sudo rm -rf openwrt/bin/targets/*/*/*.img
