#!/bin/bash
#------
# 执行deploy仓库下的脚本
# ./exec_deploy_repo_shell.sh [仓库分组] [仓库名称] [脚本名称] [脚本参数1] [脚本参数2] [脚本参数n..]
#------

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/inc.sh

pdir=~/Work/src/script

mkdir -p ${pdir}
repo_group=${1}
repo_name=${2}
shell_name=${3}

git_repo_dir=${pdir}/${repo_name}
git_repo_url="ssh://git@gitlab.hiii-life.com:19901/${repo_group}/${repo_name}.git"
git_checkout_master ${git_repo_url} ${git_repo_dir}

shift 3
${git_repo_dir}/${shell_name}.sh $@
