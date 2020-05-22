#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/hiii_spider/airbnb-hiii-export.spider.hiii-life.com
#
#---------

app="airbnb-hiii-export.spider.hiii-life.com"
repo_group="hiii_spider"
subapp="airbnb_receipt_export"
repo_root="ssh://git@gitlab.hiii-life.com:19901/${repo_group}"
k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjM0MTg3In0.RRIP6nDXs_wu2iQnp1HaHPgFNZOpPl7bTzDomZuxIBLO0EPIqabFukPt689Kt__KhLv7L-XfEmblEpNdIVJ-DeGATXU4AfSDCTQ2BMK7DPLoXNBibmgvvn6UulsDpukg7eJB_idXd5ypn0tY87vsA0jPgEKdGiRVGKEWD-hIoeI"
docker_file_name="Dockerfile"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh
