#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/hiii_spider/airbnb-hiii-room-receipt.spider.hiii-life.com
#
#---------

app="airbnb-hiii-room-receipt.spider.hiii-life.com"
repo_group="hiii_spider"
repo_root="ssh://git@gitlab.hiii-life.com:19901/${repo_group}"
# k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI4MTIwIn0.ZEVgZzOwseKcL3O_qhNjLUThNC8PJSWyCfqFQCH8IFQmxS6kw14jZKSgpDSYfKHMrVrt7MDOGVk8d-Qd1sztD2Ocqe9xXYXa_ivYY9r2bLFNHcz2aCQsDBhfrYVX8FgeDOZRe3xER3kQV0exO7QXuAduXb7WWtTDWzGNMpHdjsA"
docker_file_name="Dockerfile"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh
