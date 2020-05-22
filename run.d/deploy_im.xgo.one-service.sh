#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/xgo/im.edge.xgo.one
#
#---------

cluster="xgo"
app="im.edge.xgo.one"
subapp="service"
repo_group="xgo"
docker_build_dir="build"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh
