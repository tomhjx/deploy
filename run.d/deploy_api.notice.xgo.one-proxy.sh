#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/xgo/php/api.gis.xgo.one
#
#---------

cluster="xgo"
app="api.notice.xgo.one"
subapp="proxy"
repo_group="xgo/php"
docker_build_dir="build"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh
