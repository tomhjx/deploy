#!/bin/bash

##########
# 部署项目：http://gitlab.hiii-life.com/hiii_spider/chat.spider.hiii-life.com
#
##########
. `dirname $0`/inc.sh

app="chat.spider.hiii-life.com"
repo_group="hiii_spider"
repo_root="ssh://git@gitlab.hiii-life.com:19901/${repo_group}"
docker_file_name="Dockerfile"
src_repo_url="${repo_root}/${app}.git"
src_dir=${ROOT_DIR}/deploy/repo/${app}
deploy_dir=${ROOT_DIR}/deploy/repo/deploy.${app}
docker_file_dir=${deploy_dir}
docker_file_path="${docker_file_dir}/Dockerfile"
src_stage_dir="${docker_file_dir}/src"
image_tag="${app}:latest"
k8s_config_path="${deploy_dir}/etc/kubernetes/prod.yml"
k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI2NTUwIn0.kXWUwaCCG3Gy1anDbdvLLJ3T0kIhV1YgvNs8J3VQ5FVxrcaErF7UQFT-1Yll1yLXPNmJ5crEL6hk7Loh_S6tfo9UG0qwJjjmWMWxDA0XErOU-mLmc_qkOKlxntXTM6UmSNSLP6QGQ_zj96Qj1enStpJQS6hObssNa4fB6G920OA"

deploy_repo_url="${repo_root}/deploy.${app}.git"
mkdir -p ${src_dir} ${deploy_dir}
say_progress_begin "git pull/clone 部署仓库"
info "${deploy_repo_url}"
git_pull_or_clone_master ${deploy_repo_url} ${deploy_dir}
say_progress_begin "获取当前git代码仓库最新提交日志id"
info `get_git_latest_log_id ${deploy_dir}`

say_progress_begin "git pull/clone 代码仓库"
info "${src_repo_url}"
git_pull_or_clone_master ${src_repo_url} ${src_dir}
say_progress_begin "获取当前git代码仓库最新提交日志id"
info `get_git_latest_log_id ${src_dir}`

say_progress_begin "拷贝代码到镜像构建目录"
info "${src_dir} ---> ${src_stage_dir}"
mkdir -p ${src_stage_dir}
cp -r ${src_dir}/* ${src_stage_dir}/
find ${src_stage_dir}/ -name ".git*"|xargs rm -Rf

say_progress_begin "生成镜像构建文件"
cd ${DEPLOY_DIR}
if [ -z "${is_local_build}" ]; then
    ./run.sh push aliyun-docker ${image_tag} ${docker_file_path}
else
    docker build ${docker_file_dir} -f ${docker_file_path}
fi

say_progress_begin "删除临时代码"
info "临时代码路径：${src_stage_dir}"
rm -r ${src_stage_dir}/*

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
