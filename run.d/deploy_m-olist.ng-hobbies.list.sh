#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/hiii_spider/deploy.olist-m.spider.xgo.one/
#
#---------

cluster="xgo"
app="olist-m.spider.xgo.one"
repo_group="hiii_spider"
subapp="hobbies_list"
repo_root="ssh://git@gitlab.hiii-life.com:19901/${repo_group}"
# k8s_deploy_trigger_url=""
docker_file_name="Dockerfile"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh

