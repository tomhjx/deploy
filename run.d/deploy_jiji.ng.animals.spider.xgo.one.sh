#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/hiii_spider/jiji.ng.spider.xgo.one
#
#---------

cluster="xgo"
app="jiji.ng.spider.xgo.one"
repo_group="hiii_spider"
subapp="animals"
repo_root="ssh://git@gitlab.hiii-life.com:19901/${repo_group}"
docker_file_name="Dockerfile"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh

