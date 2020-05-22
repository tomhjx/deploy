#!/bin/bash
##########
# 登录k8s pod
#
##########

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/inc.sh

name=$1
cpu=$2
mem=$3
cfgkey=$4

cd ~
myroot_path=$(pwd)

if [ ! -z "${cfgkey}" ]; then
    kubectl_config_params="--kubeconfig=${myroot_path}/.kube/${cfgkey}.config"
fi


container_name=`kubectl get cronjob ${name} ${kubectl_config_params} -o jsonpath='{.spec.jobTemplate.spec.template.spec.containers[0].name}'`

if [ -z "${container_name}" ]; then
    echo "get container name failed, pls try it again."
    exit 1
fi

qos_smt='{"spec":{"jobTemplate":{"spec":{"template":{"spec":{"containers":[{"name":"'${container_name}'","resources":{"limits":{"cpu":"'${cpu}'","memory":"'${mem}'"},"requests":{"cpu":"'${cpu}'","memory":"'${mem}'"}}}]}}}}}}'
kubectl patch cronjob ${name}  ${kubectl_config_params} -p ${qos_smt}  