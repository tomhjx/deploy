#!/bin/bash
##########
# 删除k8s定时任务
#
##########

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/inc.sh

name=$1
config=$2

cd ~
myroot_path=$(pwd)

if [ ! -z "${config}" ]; then
    kubectl_config_params="--kubeconfig=${myroot_path}/.kube/${config}.config"
fi

kubectl get cronjob ${kubectl_config_params} | egrep "${name}" | awk '{print $1}'|xargs kubectl delete cronjob ${kubectl_config_params}
