#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/hiii_spider/airbnb-hiii-room-performance.spider.hiii-life.com
#
#---------

app="airbnb-hiii-room-performance.spider.hiii-life.com"
repo_group="hiii_spider"
repo_root="ssh://git@gitlab.hiii-life.com:19901/${repo_group}"
k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjMzNjQyIn0.j7_V2pLsiSpe_OWS6T-neYmxG8mwarcLbVZV5KoRKjeAOmFhpOUI7oFJTQiNOk_6aUvhbR-l1AnSdyQrD3IfOBok_IZwIjROqgOPSnKLZvC0_EhisR-jb6ybVoibOQWUyskmFd3CeQxesAxqOPN91gzVLB34VAPUr7gYdRVIgJc"
docker_file_name="Dockerfile"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh
