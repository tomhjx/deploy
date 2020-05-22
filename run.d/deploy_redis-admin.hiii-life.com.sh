#!/bin/bash

#------
# 部署redis管理后台
#
#-----

. `dirname $0`/inc.sh

# k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI4MjQxIn0.YbXoKH-qJm2WN2avPMhOWFQ3nmT8IzypaNZp16s8YQRTPD19TCNhCUQzHFwEm4-Ty4CsJvJY8tfKHCqv3UCjzDCnvV6wWsVnCX9_nLo33SYueY1PuXaqsEthdM39fdvo2kLOE0f0MliScG71XXuylp5GGyv87qgxftgUx8cVyfA"

cd $DEPLOY_DIR
./run.sh push aliyun-docker redis-admin.hiii-life.com:prod ./docker/phpredisadmin

say_progress_begin "更新部署配置"
kubectl apply -f etc/redis-admin.hiii-life.com/kubernetes/prod.yml

cd ${CURR_DIR}
if [ ! -z "${k8s_deploy_trigger_url}" ]; then
    say_progress_begin "重新部署"
    curl -s ${k8s_deploy_trigger_url}
fi

say_last_progress_status
