#!/bin/bash
##########
# 在k8s集群中，获取1分钟执行1次的定时任务名称
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

kubectl get cronjob ${kubectl_config_params} --no-headers=true|awk '$2=="*" {print $1}'