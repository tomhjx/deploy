#!/bin/bash
##########
# 获取资源分配不合理的deployment
#
##########

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/inc.sh

cfgkey=$1

cd ~
myroot_path=$(pwd)

if [ ! -z "${cfgkey}" ]; then
    kubectl_config_params="--kubeconfig=${myroot_path}/.kube/${cfgkey}.config"
fi


kubectl get pod ${kubectl_config_params} -o=custom-columns=NAME:.metadata.name,CONTAINER:.spec.containers[0].name,REQ_CPU:.spec.containers[0].resources.requests.cpu,LIMIT_CPU:.spec.containers[0].resources.limits.cpu,REQ_MEM:.spec.containers[0].resources.requests.memory,LIMIT_MEM:.spec.containers[0].resources.limits.memory,REPLICAS:.spec.replicas,OWNER_KIND:.metadata.ownerReferences[0].kind|awk '$3!=$4||$5!=$6  {print $0}'