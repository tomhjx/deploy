#!/bin/bash
##########
# 删除k8s Evicted pod
#
##########

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/inc.sh

name=$1
cluster=$2

cd ~
myroot_path=$(pwd)

if [ ! -z "${cluster}" ]; then
    kubectl_config_params="--kubeconfig=${myroot_path}/.kube/${cluster}.config"
fi

kubectl get pods ${kubectl_config_params}| grep Evicted | awk '{print $1}' | xargs kubectl delete pod  ${kubectl_config_params}
