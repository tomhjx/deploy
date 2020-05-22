#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/hiii/api.saas.hiii-life.com
#
#---------

cluster="xgo"
app="mongo"
subapp="service"
repo_group="xgo"
docker_build_dir="build"
k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjM2UyZDYyNTRiMzAyNDUxMWIzNzdkZGJlZjdhZjM2NDUiLCJpZCI6IjQwNTg5In0.ElNqeETlKck9HzRurAHsXzcFGivxOhcYug6MpO8RQfD0Fz6US-J6PVBzH6IBBgl-88UnsGbByC9FzrtnMwVVV_VdEPLaXr_ASDZsOUHhgFFItHNECANzctLCLbQcf75HqPE0oaa63q7l0lGK3cYo1pnh75uODOG9DoerMKC15ws"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.nosrc-app.inc.sh
