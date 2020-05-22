#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/hiii/api.saas.hiii-life.com
#
#---------

cluster="xgo"
app="api.moto-activity.xgo.one"
subapp="proxy"
repo_group="xgo"
docker_build_dir="build"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh
