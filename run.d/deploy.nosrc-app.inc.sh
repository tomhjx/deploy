#!/bin/bash

# 定义方法
. `dirname $0`/deploy.define.func-inc.sh
. `dirname $0`/deploy.pull_src.func-inc.sh
. `dirname $0`/deploy.before_build_image.func-inc.sh
. `dirname $0`/deploy.build_image.func-inc.sh
. `dirname $0`/deploy.after_build_image.func-inc.sh
. `dirname $0`/deploy.pub_k8s.func-inc.sh


# 拉取构建服务的源码
function pull_src()
{
    repo_root="ssh://git@gitlab.hiii-life.com:19901/${repo_group}"
    repo_dir=${ROOT_DIR}/deploy/repo/deploy.${app}
    deploy_repo_url="${repo_root}/deploy.${app}.git"
    tag='v1'
    mkdir -p ${repo_dir}
    say_progress_begin "git pull/clone 部署仓库"
    info "${deploy_repo_url}"
    git_checkout_master ${deploy_repo_url} ${repo_dir}

}

# 构建镜像之前
function before_build_image()
{
    docker_file_name="Dockerfile"
    deploy_dir=${repo_dir}
    if [ ! -z "${subapp}" ]; then
        deploy_dir="${deploy_dir}/${subapp}"
    fi
    docker_build_dir=/${docker_build_dir}
    docker_file_dir=${deploy_dir}${docker_build_dir}
    docker_file_path="${docker_file_dir}/${docker_file_name}"
}

function after_build_image()
{
    return;
}

# 按策略执行
. `dirname $0`/deploy.strategy.patch-inc.sh