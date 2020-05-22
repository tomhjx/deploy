#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/xgo/php/api.gis.xgo.one
#
#---------

cluster="xgo"
app="api.bi.xgo.one"
subapp="fpm"
repo_group="xgo"
docker_build_dir="build"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh
