#!/bin/bash -e

HELM_VERSION=v3.8.2

curl -L https://get.helm.sh/helm-${HELM_VERSION}-linux-${ARCH}.tar.gz -o - | \
	tar xz --to-stdout | \
	install -m 755 /dev/stdin "${ROOTFS_DIR}/usr/local/bin/helm"
