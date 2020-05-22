#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/hiii_spider/airbnb-room-info-by-id.spider.hiii-life.com
#
#---------

app="airbnb-room-info-by-id.spider.hiii-life.com"
repo_group="hiii_spider"
repo_root="ssh://git@gitlab.hiii-life.com:19901/${repo_group}"
k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjM0MTg4In0.uoB8Y16Bus1qEwx4yGUvOtgDhvXXRo9Ve2y7htVbebFaBV9syRx4B3boXaFMziuheEmLnvZUZtWlstnc_rI1KWz_dMlc9dmE1Zn8djWs5UeCwo3q9Jeb7BhLB0Ho3HS2H0bIAddJxngGochODKxp-V_RkJLDWaBUWLVQdgCkjS8"
docker_file_name="Dockerfile"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh
