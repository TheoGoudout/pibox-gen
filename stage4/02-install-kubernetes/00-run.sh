#!/bin/bash -e

K3S_CHANNEL=stable
K3S_EXEC_ARGS=( \
	server \
	--cluster-cidr=172.30.0.0/16 \
	--service-cidr=172.31.0.0/16 \
	--kubelet-arg=node-ip=0.0.0.0 \
	--node-name="${CURRENT_HOSTNAME}" \
	--disable=traefik \
	--kubelet-arg container-log-max-files=3 \
	--kubelet-arg container-log-max-size=10Mi \
	--disable-network-policy \
)

on_chroot << EOF
curl --connect-timeout 10 --retry 5 --retry-delay 3 -L https://get.k3s.io -o - | \
	INSTALL_K3S_CHANNEL="${K3S_CHANNEL}" \
	INSTALL_K3S_EXEC="${K3S_EXEC_ARGS[@]}" sh

systemctl enable k3s.service
EOF
