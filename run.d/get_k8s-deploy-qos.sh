#!/bin/bash
##########
# 获取deploy对象的qos信息
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


kubectl get deployment ${kubectl_config_params} -o=custom-columns=NAME:.metadata.name,CONTAINER:.spec.template.spec.containers[0].name,REQ_CPU:.spec.template.spec.containers[0].resources.requests.cpu,LIMIT_CPU:.spec.template.spec.containers[0].resources.limits.cpu,REQ_MEM:.spec.template.spec.containers[0].resources.requests.memory,LIMIT_MEM:.spec.template.spec.containers[0].resources.limits.memory,REPLICAS:.spec.replicas