#!/bin/bash

##########
# 部署项目：forward.proxy.hiii-life.com
#
##########
. `dirname $0`/inc.sh

app="forward.proxy.hiii-life.com"
docker_file_dir="${DOCKER_FILE_DIR}/${app}"
docker_file_path="${docker_file_dir}/Dockerfile"
image_tag="${app}:latest"
k8s_config_path="${DEPLOY_DIR}/etc/${app}/kubernetes/prod.yml"
# k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI2NTUwIn0.kXWUwaCCG3Gy1anDbdvLLJ3T0kIhV1YgvNs8J3VQ5FVxrcaErF7UQFT-1Yll1yLXPNmJ5crEL6hk7Loh_S6tfo9UG0qwJjjmWMWxDA0XErOU-mLmc_qkOKlxntXTM6UmSNSLP6QGQ_zj96Qj1enStpJQS6hObssNa4fB6G920OA"

say_progress_begin "生成镜像构建文件"
cd ${DEPLOY_DIR}
if [ -z "${is_local_build}" ]; then
    ./run.sh push aliyun-docker ${image_tag} ${docker_file_path}
else
    docker build ${docker_file_dir} -f ${docker_file_path}
fi

cd ${CURR_DIR}
say_progress_begin "更新部署配置"
if [ -f "${k8s_config_path}" ]; then
    kubectl apply -f "${k8s_config_path}"
fi
if [ ! -z "${k8s_deploy_trigger_url}" ]; then
    say_progress_begin "重新部署"
    curl -s ${k8s_deploy_trigger_url}
fi
say_last_progress_status
