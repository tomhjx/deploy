#!/bin/bash
#------
# 部署项目 http://gitlab.hiii-life.com/hiii_php/api.user.hiii-life.com
#
#------

$(dirname $0)/exec_deploy_repo_shell.sh hiii_php deploy.api.user.hiii-life.com update ${1}
