#!/bin/bash

#--------
# 部署项目：http://gitlab.hiii-life.com/hiii_spider/deploy.jumia-hotel.spider.hiii-life.com/tree/master/hotel_detail_spider
#
#--------

app="jumia-hotel.spider.hiii-life.com"
repo_group="hiii_spider"
subapp="hotel_detail_spider"
repo_root="ssh://git@gitlab.hiii-life.com:19901/${repo_group}"
k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI4Nzc0In0.PEQbj5vXairAsunBhQT0rHx_sxQMRRgyQgvB-oGX4ZdFAX-XMTsjyaTjeoY1Ln-M1T02-QlW7dguRrPov9yyqMxLMDiKigqNP6bFOuDViMpssL0KeVF_D0fP0Dkng3mWEW_wrt8Zw5IAYJGMa8Ch6xxIdW7L0c5Ue8gGi-5l42o"
docker_file_name="Dockerfile"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh
