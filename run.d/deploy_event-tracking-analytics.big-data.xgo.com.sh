#!/bin/bash

#--------
# 部署项目：http://gitlab.hiii-life.com/hiii-big-data/event-tracking.big-data.xgo.com
#
#--------

cluster="xgo"
app="event-tracking.big-data.xgo.com"
subapp="analytics"
repo_group="hiii-big-data"
repo_root="ssh://git@gitlab.hiii-life.com:19901/${repo_group}"
k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjM2UyZDYyNTRiMzAyNDUxMWIzNzdkZGJlZjdhZjM2NDUiLCJpZCI6IjY1MDMxIn0.ilqz_5K5l_33bLGDKovvogZUi2H_Xqyr5t-phQQk_4ceQ4wPVHYoXcuRrhcPMXtujv_gjl3--yYGrlhKQkQMJXakGz34jseLP7CPOmFnKkCaQ6RYxYGS2hGSjcG5IoThQKZMNm_eSMq4Eg6rAz9jS2lUvuzy1FJYK3t9c0sZHN0"
docker_file_name="Dockerfile"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh
