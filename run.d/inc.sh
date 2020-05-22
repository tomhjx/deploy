#!/bin/bash
get_system_version() {
    #系统信息
    [ -f '/etc/issue' ] && sysInfoFile='/etc/issue'
    [ -f '/etc/centos-release' ] && sysInfoFile='/etc/centos-release'

    if [[ -z "${sysInfoFile}" ]]; then
        echo "unknown"
        return
    fi

    sysinfo=($(cat $sysInfoFile |head -n1))
    sysname=$(echo ${sysinfo[0]} |tr '[A-Z]' '[a-z]')
    sysver=$(echo ${sysinfo[@]} |awk '{print $(NF-1)}') #5.11
    sysarch=$(uname -m)
    SYSINFO=${sysname}-$sysver-$sysarch
    echo ${SYSINFO}
}

check_root() {
    if [ $UID -gt 0 ]; then
       

    echo $1
echo "[Error]: You must be root to run this script!"
        exit 1
    fi
}

function check_signal() {
    if [[ $1 -ne 0 ]]; then
        failed "${2}"
    fi
    succeed "${2}"
}

function failed() {
    echo -e "\033[31m[ × ] ${1}\033[0m"
    exit 1
}

function info() {
    echo "[ - ] $1"
}

function succeed() {
    echo -e "\033[32m[ √ ] ${1}\033[0m";
}

progressName='';

function say_progress_begin() {
    say_last_progress_status
    progressName=${1}
    info "${1} ......"
}

function say_last_progress_status() {
    res=$?
    if [[ "" == "${progressName}" ]]; then
        return
    fi
    check_signal ${res} "${progressName}"
}

function git_pull_or_clone_web_src_quickly()
{
    branch=$2
    repo=ssh://git@gitlab.hiii-life.com:19901/hiii/${1}.git
    dir=${ROOT_DIR}/src/web/${1}
    git_pull_or_clone $repo $dir $branch
}


function git_checkout()
{
    branch=$3
    repo=$1
    dir=$2

    if [ -z "${branch}" ]; then
        failed "git pull/clone 必须指定分支或标签名称"
    fi
    
    mkdir -p $dir
    cd $dir
    if [ -d '.git' ]; then
        git checkout $branch
        git pull
    else
        git clone $repo $dir -b $branch
    fi
    cd $CURR_DIR
}

function git_checkout_master()
{
    git_checkout $1 $2 master 
}

function replace_compose_yml()
{
    env=$2
    compose_name=$1
    if [ ! -z "${env}" ]; then
        cp ${DOCKER_FILE_DIR}/${compose_name}-env.tpl ${DOCKER_FILE_DIR}/${compose_name}.${env}.yml
        sed -i.bak "s?{ENV}?${env}?g" ${DOCKER_FILE_DIR}/${compose_name}.${env}.yml
    fi
}

function git_checkout_tag()
{
    tag=$3
    repo=$1
    dir=$2

    git_checkout_master ${repo} ${dir}

    cd ${dir}
    if [ -z "${tag}" ]; then
        tag=$(git describe --tags `git rev-list --tags --max-count=1`)
    fi

    if [ -z "${tag}" ]; then
        failed "缺少可用标签"
    fi
    git checkout ${tag}
    cd ${CURR_DIR}
}


function git_pull_or_clone()
{
    branch=$3
    repo=$1
    dir=$2

    if [ -z "${branch}" ]; then
        failed "git pull/clone 必须指定分支或标签名称"
    fi
    
    mkdir -p $dir
    cd $dir
    if [ -d '.git' ]; then
        git pull
    else
        git clone $repo $dir -b $branch
    fi
    cd $CURR_DIR
}

function git_pull_or_clone_master()
{
    git_pull_or_clone $1 $2 master 
}


function git_pull_or_clone_tag()
{
    tag=$3
    repo=$1
    dir=$2

    git_pull_or_clone_master ${repo} ${dir}

    cd ${dir}
    if [ -z "${tag}" ]; then
        tag=$(git describe --tags `git rev-list --tags --max-count=1`)
    fi

    if [ -z "${tag}" ]; then
        failed "缺少可用标签"
    fi
    git checkout ${tag}
    cd ${CURR_DIR}
}

function check_docker()
{
    docker -v
    if [[ $? -ne 0 ]]; then
        echo "需要先安装并启动 docker: "
        echo "https://docs.docker.com/docker-for-mac/install/"
        echo "https://docs.docker.com/install/linux/docker-ce/centos/"
        exit 1
    fi 
}

function check_docker_compose()
{
    check_docker
    docker-compose -v
    if [[ $? -ne 0 ]]; then
        echo "需要先安装 docker compose: "
        echo "$ curl -sSL https://get.docker.com/ | sh"
        echo "$ sudo pip install docker-compose"
        exit 1
    fi
}

# check_help 参数 "这是帮助" 
function check_help()
{
    if [[ "$1" == "-h" || "$1" == "help" || "$1" == "--help" ]]; then
        path=$0
        pos=$(egrep "^#-+$" -n ${path}|cut -d : -f 1|tr "\n" ",")
        pos=${pos%,*}
        sed -n ${pos}p ${path}
        exit 0;
    fi
}

function get_git_latest_log_id()
{
    cd ${1}
    version=`git log -n 1|head -1|awk '{print $2}'`
    if [ -z "${version}" ]; then
        failed "git log id获取失败"
    fi
    cd ${CURR_DIR}
    echo "${version}"
}

# 当前目录
CURR_DIR=`pwd`

# ~/Work/project/hiii/run.d/
PARENT_DIR=`dirname $0`
cd ${PARENT_DIR}
PARENT_DIR=`pwd`
cd ${CURR_DIR}

# ~/Work/project/hiii
DEPLOY_DIR=`dirname ${PARENT_DIR}`

# ~/Work/project/hiii/docker
DOCKER_FILE_DIR=${DEPLOY_DIR}/docker

# ~/Work/ 
ROOT_DIR=`dirname $(dirname ${DEPLOY_DIR})`

check_help $1
