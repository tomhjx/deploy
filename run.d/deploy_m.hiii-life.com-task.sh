#!/bin/bash

##########
# 部署项目：http://gitlab.hiii-life.com/hiii/m.hiii-life.com
#
##########

app="m.hiii-life.com"
subapp="task"
repo_group="hiii"
docker_build_dir="build"
k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjMwODY4In0.tta50V_FsSrKBztaI5LNZ_oYZymsuzwuhm9aUN8Pz6sZt9rCt7swxzPX6fIS5kCpXU1gMh07Tyl84iV2FWcW3CceT0zvEXPmf2-1iVtX-9yf89_3TZTwM0N2OynDe_5expeK9dWOLFOX_hV-2jW6fcIP5xk4cuxWySZGEel-w18"
ignore_src_files="{thumbfile,upgrade,uploadfile}"
PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh