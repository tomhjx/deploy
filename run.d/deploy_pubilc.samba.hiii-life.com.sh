#!/bin/bash

##########
# 部署公共samba文件共享服务
#
##########

. `dirname $0`/inc.sh

k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI3MDUzIn0.C1EGCxP8IpLgof4ayLyKugnkSn1sCNI0W7X3j3rGPa6ztGh5DDrmuAOADY8jVFlfz38E0xOTlZTdX9VSE4zDtt8xXGAaCjzz9Nr1Hd4xnckQ4V3e2xAFhuuljVzB6NEiFc0ILkxA3oBBYSD5ijfC-DgqakE83-vgXIC43v241yU"

cd $DEPLOY_DIR
./run.sh push aliyun-docker public.samba.hiii-life.com:latest ./docker/public.samba.hiii-life.com

say_progress_begin "更新部署配置"
kubectl apply -f etc/samba.hiii-life.com/kubernetes/prod.yml

cd ${CURR_DIR}
if [ ! -z "${k8s_deploy_trigger_url}" ]; then
    say_progress_begin "重新部署"
    curl -s ${k8s_deploy_trigger_url}
fi

say_last_progress_status
