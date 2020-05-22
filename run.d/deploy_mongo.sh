#!/bin/bash

#----------
# 部署mongo
#
#----------

. `dirname $0`/inc.sh

k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI4NTgzIn0.XlR34cte2C7F1BjgkoeURf95tXL4okOmL6pMoqCvDZz-lMgZFXBrT7RE3m-r2A-PgS6sP1vsvlwZaoCRQXIz36V66ugTEXGJv8_VOlXKRVsqglA-D-du7qsBJ9ejk3Utky-uj91RKwuRZUCmr8UW4UrKW3leniO4nWY1ucRL-hs"

cd $DEPLOY_DIR
./run.sh push aliyun-docker mongo:prod ./docker/mongo

say_progress_begin "更新部署配置"
kubectl apply -f etc/mongo/kubernetes/prod.yml

cd ${CURR_DIR}
if [ ! -z "${k8s_deploy_trigger_url}" ]; then
    say_progress_begin "重新部署"
    curl -s ${k8s_deploy_trigger_url}
fi

say_last_progress_status
