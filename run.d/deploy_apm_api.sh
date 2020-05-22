#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/xgo/deploy.nginx-apm
#
#---------

cluster="xgo"
app="nginx-apm"
subapp="service"
repo_group="xgo"
docker_build_dir="build"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.nosrc-app.inc.sh
