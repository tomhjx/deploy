#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/hiii_spider/python-data-anaylitics.big-data.xgo.com
#
#---------

cluster="xgo"
app="python-data-anaylitics.big-data.xgo.com"
repo_group="hiii-big-data"
repo_root="ssh://git@gitlab.hiii-life.com:19901/${repo_group}"
subapp="daily_lottery_data_html"
# k8s_deploy_trigger_url=""
docker_file_name="Dockerfile"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh

