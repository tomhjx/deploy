#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/hiii_spider/airdna-analytics.spider.hiii-life.com
#
#---------

app="airdna-analytics.spider.hiii-life.com"
repo_group="hiii_spider"
repo_root="ssh://git@gitlab.hiii-life.com:19901/${repo_group}"
k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjM0MTg5In0.sLXypbmIrV2VzQdsp4WuJe39UgbNvK5tbtdATdAh-2J43SGCz6cQpqrdTgirefVzWC8PJBFnrAD-AL3Jjpb5gWyUfe7zTHScBmePn4WRp8tT74wnps8RZyJkFakKU1jrxuyrsiQiISOl6KOy9rxMKBcMVV5AUTQow90z9N6vcFc"
docker_file_name="Dockerfile"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh
