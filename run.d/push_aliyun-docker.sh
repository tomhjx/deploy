#!/bin/bash
##########
# 推送到阿里云容器镜像仓库
#
##########

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/inc.sh

name=$1
dockerFile=$2
registry_area=$3
if [ -z "${registry_area}" ];then
    registry_area="cn-shenzhen"
fi

fullName="registry.${registry_area}.aliyuncs.com/hiii/${name}"

info "docker file path: ${dockerFile}"

say_progress_begin "构建镜像"

if [ -d ${dockerFile} ]; then
    docker build -t ${fullName} ${dockerFile}
else
    dockerFileDir=`dirname ${dockerFile}`
    info "构建镜像的工作目录路径：${dockerFileDir}"
    docker build -t ${fullName} ${dockerFileDir} -f ${dockerFile}
fi

say_progress_begin "构建项目镜像并推送到阿里云私有镜像仓库"

docker push ${fullName}

say_last_progress_status

exit $?
