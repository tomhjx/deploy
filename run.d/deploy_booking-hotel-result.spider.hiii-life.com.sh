#!/bin/bash

##########
# 部署项目：http://gitlab.hiii-life.com/hiii_spider/deploy.booking-hotel.spider.hiii-life.com/tree/master/result
#
##########

app="booking-hotel.spider.hiii-life.com"
repo_group="hiii_spider"
subapp="result"
repo_root="ssh://git@gitlab.hiii-life.com:19901/${repo_group}"
k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI4MTE4In0.fPUSpFF8Tj1-Eq847h85pNRnMjwYrYxi8iYwF07P61-l1f7Fgk0I_r1QgTKsuRmLJHMnI-bjcCmhVhEF8EnFgghCGInrw95_aVR5N3d3xHAlvGEbop-wnhNlObYjsjhrFK0Y4gVIJPJUTrEqo6jmXqhVr-T7movD4Sy8sx9039Y"
docker_file_name="Dockerfile"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh
