#!/bin/bash

set -o nounset
set -o errexit
set -o pipefail

CONFIG="${SHARED_DIR}/install-config.yaml"

KUBEVIRT_BASE_DOMAIN="tenant1.origin-on-kubevirt.dev.openshift.com"
KUBEVIRT_API_VIP=192.168.123.15
KUBEVIRT_INGRESS_VIP=192.168.123.20
KUBEVIRT_KUBECONFIG=${CLUSTER_DIR}/.kubevirt/kubeconfig
KUBEVIRT_NAMESPACE=tenantcluster
KUBEVIRT_NETWORK_NAME=tenantcluster
KUBEVIRT_VOLUME_ACCESS_MODE=ReadWriteMany

cat >> "${CONFIG}" << EOF
baseDomain: ${KUBEVIRT_BASE_DOMAIN}
platform:
  kubevirt:
    # TODO this section is WIP - see the installer PR
    IngressVIP: ${KUBEVIRT_INGRESS_VIP}
    apiVIP: ${KUBEVIRT_API_VIP}
    kubeconfig: ${KUBEVIRT_KUBECONFIG}
    namespace: ${KUBEVIRT_NAMESPACE}
    networkName: ${KUBEVIRT_NETWORK_NAME}
    persistentVolumeAccessMode: ${KUBEVIRT_VOLUME_ACCESS_MODE}
EOF

