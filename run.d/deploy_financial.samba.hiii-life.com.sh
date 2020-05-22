#!/bin/bash

##########
# 部署财务samba文件共享服务
#
##########

. `dirname $0`/inc.sh

k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI2Nzg0In0.KxjtMy6YBgI5r7i-81nUDvbYg-9k0qzbXcvnceOwKXlR-U-cnr6Ty6OFijtF5ss_JFIEZJQggWmeboCkfZdB_vHElMOlov29C_CvIRo5kgdTvvZ_o3nfj0qOqr67zlbhBgDHVMg-B-_UxoHg5AyWE6VgY4Bm0_jiF0uAxHXmnlk"

cd $DEPLOY_DIR
./run.sh push aliyun-docker financial.samba.hiii-life.com:latest ./docker/financial.samba.hiii-life.com

say_progress_begin "更新部署配置"
kubectl apply -f etc/samba.hiii-life.com/kubernetes/prod.yml

cd ${CURR_DIR}
if [ ! -z "${k8s_deploy_trigger_url}" ]; then
    say_progress_begin "重新部署"
    curl -s ${k8s_deploy_trigger_url}
fi

say_last_progress_status
