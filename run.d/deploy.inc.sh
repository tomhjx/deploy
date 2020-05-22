#!/bin/bash

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/inc.sh

if [ -z "${THIS_PROJECT_NAME}" ]; then
    failed "missing THIS_PROJECT_NAME"
fi

projectRepoUrl="ssh://git@gitlab.hiii-life.com:19901/hiii/${THIS_PROJECT_NAME}.git"

if [ -z "${THIS_PROJECT_DOCKER_DIR_NAME}" ]; then
   THIS_PROJECT_DOCKER_DIR_NAME=${THIS_PROJECT_NAME} 
fi

if [ -z "${DEPLOY_ENV}" ]; then
    DEPLOY_ENV='prod'
fi
imageTag="${THIS_PROJECT_DOCKER_DIR_NAME}:${DEPLOY_ENV}"

projectPath=${ROOT_DIR}/deploy/repo/${THIS_PROJECT_NAME}

dockerDir=${DOCKER_FILE_DIR}/${THIS_PROJECT_DOCKER_DIR_NAME}

mkdir -p ${projectPath}

say_progress_begin "git pull/clone 项目仓库"

info "git仓库： ${projectRepoUrl}"

git_checkout_master ${projectRepoUrl} ${projectPath}

say_progress_begin "获取当前git仓库最新提交日志id"

cd ${projectPath}
version=`git log -n 1|head -1|awk '{print $2}'`

if [ -z "${version}" ]; then
    failed "git log id获取失败"
fi

info ${version}

say_progress_begin "生成镜像构建文件"

dockerSrcDir=${dockerDir}/src
mkdir -p ${dockerSrcDir}

prodPath="${dockerDir}/Dockerfile"

say_progress_begin "拷贝构建后的代码到项目镜像"

info "${projectPath} ---> ${dockerSrcDir}"

cp -r ${projectPath}/* ${dockerSrcDir}/

# THIS_PROJECT_SRC_IGNORE_FILES="{dir1,dir2,dir3/file1}"
# THIS_PROJECT_SRC_IGNORE_FILES="dir1"
if [ ! -z "${THIS_PROJECT_SRC_IGNORE_FILES}" ]; then
    eval "rm -rf ${dockerSrcDir}/${THIS_PROJECT_SRC_IGNORE_FILES}"
fi
touch "${dockerSrcDir}/~${DEPLOY_ENV}.env"

find ${dockerSrcDir}/ -name ".git*"|xargs rm -Rf

cd ${DEPLOY_DIR}

if [ -z "${THIS_PROJECT_LOCAL_BUILD}" ]; then
    ./run.sh push aliyun-docker ${imageTag} ${prodPath}
else
    docker build ${dockerDir} -f ${prodPath}
fi


say_progress_begin "删除临时代码"

info "临时代码路径：${dockerSrcDir}"

rm -r ${dockerSrcDir}/*

cd ${DEPLOY_DIR}

say_progress_begin "更新部署配置"

k8s_config_path="etc/${THIS_PROJECT_NAME}/kubernetes/${DEPLOY_ENV}.yml"
if [ -f "${k8s_config_path}" ]; then
    kubectl apply -f "${k8s_config_path}"
fi

cd ${CURR_DIR}

if [ ! -z "${THIS_DEPLOY_TRIGGER_URL}" ]; then

    say_progress_begin "重新部署"
    curl -s ${THIS_DEPLOY_TRIGGER_URL}
fi

say_last_progress_status
