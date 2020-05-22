#!/bin/bash
##########
# 登录阿里云容器镜像仓库
#
##########

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/inc.sh


AUTH_PATH=~/.auth/aliyun.registry.pwd

registry_area=$1
if [ -z "${registry_area}" ];then
    registry_area="cn-shenzhen"
fi

user=`head -1 ${AUTH_PATH}` 
pwd=`tail -1 ${AUTH_PATH}`
echo ${user}
echo ${pwd}
echo ${pwd}|docker login -u ${user} --password-stdin "registry.${registry_area}.aliyuncs.com"
