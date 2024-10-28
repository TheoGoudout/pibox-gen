#!/bin/bash -e

install -dm 755 "${ROOTFS_DIR}/var/log/samba/"
install -dm 755 "${ROOTFS_DIR}/var/lib/rancher/k3s/storage"

install -m 644 files/smb.conf "${ROOTFS_DIR}/etc/samba/smb.conf"

on_chroot << EOF
echo -e "kubesail\nkubesail" | smbpasswd pi -a -s
EOF
