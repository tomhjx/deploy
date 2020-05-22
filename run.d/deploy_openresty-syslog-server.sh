#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/xgo/deploy.openresty-syslog-server
#
#---------

cluster="xgo"
app="openresty-syslog-server"
subapp="service"
repo_group="hiii-big-data"
docker_build_dir="build"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.nosrc-app.inc.sh
