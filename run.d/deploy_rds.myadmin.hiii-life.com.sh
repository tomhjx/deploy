#!/bin/bash

##########
# 部署测试mysql admin
#
##########

. `dirname $0`/inc.sh

# k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI2OTQ3In0.M2Jia3vP0Z1joa4ij8y3DLjSyaFREx_17FK__uMDgO4shvfZv1cUxz1HFgxo6d8XzoDvp5-da96WgMoTJwd9fJCiDSLbRM_Wsdvg9RJDmANImI7PWAHQm5OfS7ylIDNIxZybALmBiGi55CydrPTC6PzuqYB8MfB7OnUU99leM74"

cd $DEPLOY_DIR
./run.sh push aliyun-docker myadmin.hiii-life.com:latest ./docker/myadmin.hiii-life.com

say_progress_begin "更新部署配置"
kubectl apply -f etc/myadmin.hiii-life.com/kubernetes/prod.yml

cd ${CURR_DIR}
if [ ! -z "${k8s_deploy_trigger_url}" ]; then
    say_progress_begin "重新部署"
    curl -s ${k8s_deploy_trigger_url}
fi

say_last_progress_status
