#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/hiii_spider/jiji-ng-seller-page.spider.xgo.one
#
#---------

cluster="xgo"
app="jiji-ng-seller-page.spider.xgo.one"
repo_group="hiii_spider"
subapp="created_url"
repo_root="ssh://git@gitlab.hiii-life.com:19901/${repo_group}"
# k8s_deploy_trigger_url=""
docker_file_name="Dockerfile"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh
