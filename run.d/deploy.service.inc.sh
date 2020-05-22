#!/bin/bash
. `dirname $0`/inc.sh

repo_dir=${ROOT_DIR}/deploy/repo/deploy.${app}
deploy_dir=${repo_dir}
if [ -z "${subapp}" ]; then
   image_name=${app}
else
   image_name="${app}-${subapp}"
   deploy_dir="${deploy_dir}/${subapp}"
fi

if [ -z "${tag}" ]; then
   tag="latest"
fi

docker_build_dir=/${docker_build_dir}

docker_file_dir=${deploy_dir}${docker_build_dir}
docker_file_path="${docker_file_dir}/${docker_file_name}"

info "镜像地址：${image_registry}"
info "k8s配置路径：${k8s_config_path}"

deploy_repo_url="${repo_root}/deploy.${app}.git"
mkdir -p ${repo_dir}
say_progress_begin "git pull/clone 部署仓库"
info "${deploy_repo_url}"
git_pull_or_clone_master ${deploy_repo_url} ${repo_dir}
say_progress_begin "获取当前git代码仓库最新提交日志id"
info `get_git_latest_log_id ${repo_dir}`

env='prod'
image_tag="${env}.${tag}"
image_full="${image_name}:${image_tag}"
k8s_config_path="${deploy_dir}/etc/kubernetes/prod.yml"
image_registry="registry-vpc.cn-shenzhen.aliyuncs.com/hiii/${image_name}:${image_tag}"

say_progress_begin "生成镜像构建文件"
cd ${DEPLOY_DIR}
if [ -z "${is_local_build}" ]; then
    ./run.sh push aliyun-docker ${image_full} ${docker_file_path}
else
    docker build ${docker_file_dir} -f ${docker_file_path}
fi

cd ${CURR_DIR}
say_progress_begin "更新部署配置"
if [ -f "${k8s_config_path}" ]; then
    target_k8s_config_path=${k8s_config_path}.target
    cp ${k8s_config_path} ${target_k8s_config_path}
    sed -i.bak "s?{image}?${image_registry}?g" ${target_k8s_config_path}
    kubectl apply -f "${target_k8s_config_path}"
fi
if [ ! -z "${k8s_deploy_trigger_url}" ]; then
    say_progress_begin "重新部署"
    curl -s ${k8s_deploy_trigger_url}
fi
say_last_progress_status
