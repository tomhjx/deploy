#!/bin/bash

##########
# 部署测试mysql
#
##########

. `dirname $0`/inc.sh

k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI2OTIxIn0.Q0u-boj3QuFIc9hoVO-W6fBR7NX3c-50ubPBaS5HufJPzRhLzDAb6FFHK6Bg4otGzcw6ueifYWRu-5GkOkKRWbJGXQbKeljxUQ-Dkj8sy2pyucTSFuUXWJBVg6rN4_uTOg7DWEpxHfU4Q3ti0BPqVtPKZOoBFyOKpiTFQMpH6is"

cd $DEPLOY_DIR
./run.sh push aliyun-docker mysql.hiii-life.com:stage ./docker/mysql

say_progress_begin "更新部署配置"
kubectl apply -f etc/mysql.hiii-life.com/kubernetes/stage.yml

cd ${CURR_DIR}
if [ ! -z "${k8s_deploy_trigger_url}" ]; then
    say_progress_begin "重新部署"
    curl -s ${k8s_deploy_trigger_url}
fi

say_last_progress_status
