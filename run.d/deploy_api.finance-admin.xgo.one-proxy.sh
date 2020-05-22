#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/hiii_php/api.moto-admin.xgo.one
#
#---------

cluster="xgo"
app="api.finance-admin.xgo.one"
subapp="proxy"
repo_group="xgo/php"
docker_build_dir="build"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh
