#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/hiii/saas.hiii-life.com
#
#---------

app="admin.spider.hiii-life.com"
subapp="proxy"
repo_group="hiii_spider"
docker_build_dir="build"
k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjMwODg2In0.KR7T0vt_oRcH-lqIrSrc7ZYVZzAGqJA7Vfzq0wDfAcxOzAt342mC4rN_4NtwJEwsxjEJJPSBdzDPj8kFRD0Z4SgNX4NiTpLwJ2SlOKl95zkRdUQ2lG240iTQ8qiuLRnFXqrayNZr2JX-h5X0VoW2ac3NGHvI7IjFZC0rb1zY1XY"
PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.pack-html.inc.sh
