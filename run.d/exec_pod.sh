#!/bin/bash
##########
# 在k8s pod上执行命令
#
##########

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/inc.sh

name=$1
cmd=$2
cluster=$3

cd ~
myroot_path=$(pwd)

if [ ! -z "${cluster}" ]; then
    kubectl_config_params="--kubeconfig=${myroot_path}/.kube/${cluster}.config"
fi

podName=`kubectl get pods ${kubectl_config_params} | egrep "${name}.*Running" | tail -1 | awk '{print $1}'`
kubectl ${kubectl_config_params} exec ${podName} -- ${cmd}
