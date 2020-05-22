#!/bin/bash

##########
# 部署财务samba文件共享服务
#
##########

. `dirname $0`/inc.sh

k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI3Mjk3In0.RFkaXkcdoyww9PQ2H3Hn-Tmc5XWnzi1_QNsm2Yg9lKI9_M-Mekfr4wMTa4bMzsfoXwajMMnvleN-tT_r5NFFaq9OJFu19BCDyqYmoeUeZ-pT0AYvbKyFnqtRDWa3l4-nNz0NmN5L_qpwMdVdiQN4H7jWRspqqZKAAisSCRVhvO4"

cd $DEPLOY_DIR
./run.sh push aliyun-docker acme:latest ./docker/acme

say_progress_begin "更新部署配置"
kubectl apply -f etc/acme/kubernetes/prod.yml

cd ${CURR_DIR}
if [ ! -z "${k8s_deploy_trigger_url}" ]; then
    say_progress_begin "重新部署"
    curl -s ${k8s_deploy_trigger_url}
fi

say_last_progress_status
