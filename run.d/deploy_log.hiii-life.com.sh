#!/bin/bash

##########
# 部署日志服务
#
##########

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/inc.sh

THIS_DEPLOY_TRIGGER_URL='https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI1OTY2In0.mg5ugqAfsavvwVPnF1_QMjeM909ijUMcq069i62HB8EkzWSkWWYnSfHnM4Yc-9I5k3EXrbR7pgFRFOr3F-ONE54yC7L7vj2h6s40Mmsogmw99z9PJrPyhulz6W-BCmc7lwhfvABVFBBw8gwnD3vOQimDgAnI7odGpwavE_6AXgU'

cd $DEPLOY_DIR
./run.sh push aliyun-docker log.hiii-life.com:latest ./docker/log.hiii-life.com

say_progress_begin "更新部署配置"
kubectl apply -f etc/${THIS_PROJECT_NAME}/kubernetes/prod.yml

cd ${CURR_DIR}
if [ ! -z "${THIS_DEPLOY_TRIGGER_URL}" ]; then
    say_progress_begin "重新部署"
    curl -s ${THIS_DEPLOY_TRIGGER_URL}
fi

say_last_progress_status
