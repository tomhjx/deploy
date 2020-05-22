#!/bin/bash
##########
# 登录k8s pod
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

podName=`kubectl get pods ${kubectl_config_params} | egrep "${name}.*Running" | tail -1 | awk '{print $1}'`
kubectl ${kubectl_config_params} exec ${podName} -it /bin/bash
