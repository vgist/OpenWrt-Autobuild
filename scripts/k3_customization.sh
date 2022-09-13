#!/bin/bash

set -ex

# k3
# only build k3
sed -i 's|^TARGET_|# TARGET_|g; s|# TARGET_DEVICES += phicomm_k3|TARGET_DEVICES += phicomm_k3|' target/linux/bcm53xx/image/Makefile
# k3 device packages
sed -i '/K3/{N;s/.*/  DEVICE_MODEL := K3\n  DEVICE_PACKAGES := $(BRCMFMAC_4366C0) $(USB3_PACKAGES) -brcmfmac-firmware-4366c0-pcie k3wifi k3screenctrl/}' target/linux/bcm53xx/image/Makefile
# k3 proprietary wifi driver
cp -rf ../lede/package/lean/k3-brcmfmac4366c-firmware package/firmware/
# k3 screen control
cp -rf ../lede/package/lean/k3screenctrl package/firmware/

source ./01_customize_packages.sh

exit 0
