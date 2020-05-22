#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/hiii_spider/airbnb-room-info-by-region.spider.hiii-life.com
#
#---------

app="airbnb-room-info-by-region.spider.hiii-life.com"
repo_group="hiii_spider"
repo_root="ssh://git@gitlab.hiii-life.com:19901/${repo_group}"
k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjMzNjk4In0.Au14Lfay2u0oHjqeIhqmQIxQi_sAumBsgb3f7NT1KP4ie_kcG76bSOxcPQJ8GimEVoVR8g_SuVefKHuEOkhE9IMqtfTRMiOLR_21V8NcVit2FzyhAkVf6jymGXTERjZ6J44EhFSQoQJVsi3jKQxXR2hF_mDmI1eVUwUlBmcIFL0"
docker_file_name="Dockerfile"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh
