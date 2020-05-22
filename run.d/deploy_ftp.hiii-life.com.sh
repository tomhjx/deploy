#!/bin/bash

##########
# 部署ftp文件共享服务
#
##########

. `dirname $0`/inc.sh

k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI2ODEzIn0.A5vnZk02_M_7i5s03pfHX4ZAfZuXwmsgWpAXk4fJvbzRncZYa5IuxmJI68bSYsi9DPVN_jWYct-yjeZxwRTSMnDIYZhJz47rVdn9dEw5F3HlcoFkJE4HVzmOkpXBtAGJg9LTBCIuKA2Ym-VBv-dwPOGkNbeEuI0IEgAi59Ncd1k"

cd $DEPLOY_DIR
./run.sh push aliyun-docker ftp.hiii-life.com:latest ./docker/ftp.hiii-life.com

say_progress_begin "更新部署配置"
kubectl apply -f etc/ftp.hiii-life.com/kubernetes/prod.yml

cd ${CURR_DIR}
if [ ! -z "${k8s_deploy_trigger_url}" ]; then
    say_progress_begin "重新部署"
    curl -s ${k8s_deploy_trigger_url}
fi

say_last_progress_status
