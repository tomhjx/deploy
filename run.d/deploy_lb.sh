#!/bin/bash

##########
# 部署负载均衡服务
#
##########

. `dirname $0`/inc.sh

k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI2OTg1In0.khwCCWoRWvhBxSpqfVUC_Lh7W5JnHF2mok9qmDAJ9ukGI3T4q39lCtIDZGIYhyRLpEql3vIAq5UE2GvPkPskCETD4OQH18UHAMQm-2vOT8BpcPPjVLbERSskHwkWQasN7e35s__d0nWd_beD6YQQsvQLq45VlUoNhFkXDwwQ9Yc"

cd $DEPLOY_DIR
./run.sh push aliyun-docker lb:prod ./docker/lb

say_progress_begin "更新部署配置"
kubectl apply -f etc/lb/kubernetes/prod.yml

cd ${CURR_DIR}
if [ ! -z "${k8s_deploy_trigger_url}" ]; then
    say_progress_begin "重新部署"
    curl -s ${k8s_deploy_trigger_url}
fi

say_last_progress_status
