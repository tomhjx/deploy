#!/bin/bash

#--------
# 部署项目：http://gitlab.hiii-life.com/hiii_spider/deploy.jumia-hotel.spider.hiii-life.com/tree/master/hotel_condition_spider
#
#--------

app="jumia-hotel.spider.hiii-life.com"
repo_group="hiii_spider"
subapp="hotel_condition_spider"
repo_root="ssh://git@gitlab.hiii-life.com:19901/${repo_group}"
k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI4Nzc1In0.eFPd8SbtVBj7CQP0MarYplA9kHZNzEiNDMH90mz8AwgKF3zpID5hqU3zhqqSobnpR5gbSCRWB2hu8xEaOoP_TlO10kMa5-f6ZACa8yvQVUQlJYmg5yaNyVbIfVBy_Pt6vTfis2ycYDcJHtprpjc8-vTL-VJzKTZftliafCqqL40"
docker_file_name="Dockerfile"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh
