#!/bin/bash
##########
# 调整k8s deploy的资源申请与限制, e.g.  ~/Work/project/hiii/run.sh set k8s-deploy-qos mydelpoy 100m 512Mi myconfigname
#
##########

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/inc.sh

deployment_name=$1
cpu=$2
mem=$3
cfgkey=$4

cd ~
myroot_path=$(pwd)

if [ ! -z "${cfgkey}" ]; then
    kubectl_config_params="--kubeconfig=${myroot_path}/.kube/${cfgkey}.config"
fi


container_name=`kubectl get deploy ${deployment_name} ${kubectl_config_params} -o jsonpath='{.spec.template.spec.containers[0].name}'`

if [ -z "${container_name}" ]; then
    echo "get container name failed, pls try it again."
    exit 1
fi

qos_smt='{"spec":{"template":{"spec":{"containers":[{"name":"'${container_name}'","resources":{"limits":{"cpu":"'${cpu}'","memory":"'${mem}'"},"requests":{"cpu":"'${cpu}'","memory":"'${mem}'"}}}]}}}}'
kubectl patch deploy ${deployment_name}  ${kubectl_config_params} -p ${qos_smt}  