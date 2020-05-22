#!/bin/bash

##########
# 部署代理：http://gitlab.hiii-life.com/hiii/hlc.hiii-life.com
#
##########

app="hlc.hiii-life.com"
subapp="proxy"
repo_group="hiii_php"
docker_build_dir="build"
k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjMwMTIwIn0.bLH80sdrWjlOKeLu4owieV0YrtHHIFyPHN8CpzwI19M45OvW_8W9pkd-e864l-WkLFwSZK_ZaL74tDewkMODcRqJg6RZvxmq0txRC0_zobcHiOkWAy9dw6Y_AM6D5fYlfh7lpdLio_JNT4msEuuiiPzxBiZvX2yG8fN-NvpAd28"
PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh