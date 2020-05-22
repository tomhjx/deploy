#!/bin/bash

##########
# 部署财务webdav文件共享服务
#
##########

. `dirname $0`/inc.sh

k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI3MjA3In0.KA545AZl-kjfQdDk6g8psw97QcqyIy18oiJKaonF4opTW7s8zhOWJA2IrlQsO0utmRNq_rYyVCPHWO0euODHaWia5mtpvY56DnHAd9RnaZsTfwi7CHj6duSfhP7_qgG4YnUd4HfrEgZREvPh-o_E64NQ8ruP5-NJWRCT_N3ysag"
cd $DEPLOY_DIR
./run.sh push aliyun-docker webdav.hiii-life.com:latest ./docker/webdav.hiii-life.com

say_progress_begin "更新部署配置"
kubectl apply -f etc/webdav.hiii-life.com/kubernetes/prod.yml

cd ${CURR_DIR}
if [ ! -z "${k8s_deploy_trigger_url}" ]; then
    say_progress_begin "重新部署"
    curl -s ${k8s_deploy_trigger_url}
fi

say_last_progress_status
