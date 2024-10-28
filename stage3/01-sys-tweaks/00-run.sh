#!/bin/bash -e


install -m 644 files/journald.conf "${ROOTFS_DIR}/etc/systemd/journald.conf.d/pibox.conf"
install -m 644 files/sysctl.conf "${ROOTFS_DIR}/etc/sysctl.d/pibox.conf"
install -m 644 files/limits.conf "${ROOTFS_DIR}/etc/security/limits.d/pibox.conf"

# TODO: disable swap
