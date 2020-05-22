#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/xgo/deploy.development
#
#---------

app="development"
subapp="syslog-server"
repo_group="xgo"
docker_build_dir="build"
cluster="xgo-test"
is_com_registry=1

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.nosrc-app.inc.sh
