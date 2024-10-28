#!/bin/bash -e


install -m 755 files/kubesail-support "${ROOTFS_DIR}/usr/local/bin/kubesail-support"

install -m 644 files/disable-eee@.service "${ROOTFS_DIR}/etc/systemd/system/disable-eee@.service"

install -m 755 files/kubesail-agent.sh "${ROOTFS_DIR}/opt/kubesail/kubesail-agent.sh"
install -m 644 files/kubesail-agent.service "${ROOTFS_DIR}/etc/systemd/system/kubesail-agent.service"

install -m 755 files/fix-unknown-pods.sh "${ROOTFS_DIR}/opt/kubesail/fix-unknown-pods.sh"
install -m 644 files/fix-unknown-pods.service "${ROOTFS_DIR}/etc/systemd/system/fix-unknown-pods.service"

on_chroot << EOF
systemctl enable disable-eee@etho0.service
systemctl enable kubesail-agent.service
systemctl enable fix-unknown-pods.service
EOF
