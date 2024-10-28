#!/bin/bash -e

on_chroot << EOF
# TODO: check if this is needed
apt-get remove -yqq nftables

update-alternatives --set iptables /usr/sbin/iptables-legacy
EOF
