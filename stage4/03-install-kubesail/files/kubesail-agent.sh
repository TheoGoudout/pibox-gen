#!/bin/bash -e


# Wait for Kubectl to be up and running
# TODO: add FrameBuffer messages
until kubectl -n kube-system get pod -l k8s-app="kube-dns" -o=jsonpath='{.items[0].metadata.name}' >/dev/null 2>&1; do
  echo "Waiting for pod"
  sleep 1
done
kubectl -n kube-system wait --for=condition=ready --timeout=180s pod -l k8s-app=kube-dns
kubectl -n kube-system wait --for=condition=ready --timeout=180s pod -l k8s-app=metrics-server

# Create The KubeSail cluster
if [ -v KUBESAIL_USERNAME ]; then
	# Create a cluster that will be registered directly
	KUBESAIL_CREATE_URL=https://byoc.kubesail.com/${KUBESAIL_USERNAME}.yaml
	if [ -v KUBESAIL_GATEWAY ]; then
		KUBESAIL_CREATE_URL=${KUBESAIL_CREATE_URL}?via=${KUBESAIL_GATEWAY}
	fi
else
	# Create an unregistered Kubesail cluster
	# If using FrameBuffer, a QR code will be displayed to register the cluster
	KUBESAIL_CREATE_URL=https://api.kubesail.com/byoc
fi
