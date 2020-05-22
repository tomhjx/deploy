#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/hiii_php/api.user.xgo.one
#
#---------

cluster="xgo"
app="api.user.xgo.one"
subapp="task"
repo_group="hiii_php"
docker_build_dir="build"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh
