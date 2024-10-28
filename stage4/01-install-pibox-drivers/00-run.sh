#!/bin/bash -e

PIBOX_RELEASE=v12

echo "PIBOX_RELEASE=${PIBOX_RELEASE}" | \
	install -m 644 /dev/stdin "${ROOTFS_DIR}/etc/pibox-release"

# TODO: Install fan & display driver

# # Clone PiBox OS repo for building fan/display drivers
# rm -rf pibox-os
# git clone https://github.com/kubesail/pibox-os.git
# pushd pibox-os
# echo "PIBOX_RELEASE=$(git rev-parse --short HEAD)" > /etc/pibox-release
# popd

# # Enable Fan Support
# pushd pibox-os/pwm-fan
# tar zxvf bcm2835-1.68.tar.gz
# pushd bcm2835-1.68
# ./configure && make && make install
# popd
# make && make install
# popd

# # Enable Display Driver
# pushd pibox-os/st7789_module
# make
# make install
# popd
# dtc --warning no-unit_address_vs_reg -I dts -O dtb -o /boot/overlays/drm-minipitft13.dtbo pibox-os/overlays/minipitft13-overlay.dts
# cat <<EOF >> /boot/config.txt
# dtoverlay=spi0-1cs
# dtoverlay=dwc2,dr_mode=host
# hdmi_force_hotplug=1
# dtoverlay=drm-minipitft13,rotate=0,fps=60
# EOF

# # Remove PiBox repo
# rm -rf pibox-os
