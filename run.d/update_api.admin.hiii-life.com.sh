#!/bin/bash
##########
# 部署项目 http://gitlab.hiii-life.com/hiii/api.admin.hiii-life.com
#
##########
$(dirname $0)/exec_deploy_repo_shell.sh hiii deploy.api.admin.hiii-life.com update ${1}
