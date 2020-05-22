#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/hiii-big-data/deploy.analytics-openresty-rsyslog
#
#---------

cluster="xgo"
app="analytics-rsyslog-openresty"
subapp="service"
repo_group="hiii-big-data"
docker_build_dir="build"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.nosrc-app.inc.sh
