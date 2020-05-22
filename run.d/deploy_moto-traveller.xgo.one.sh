#!/bin/bash

##########
# 部署项目：http://gitlab.hiii-life.com/hiii/admin.hiii-life.com
#
##########

cluster="xgo"
app="moto-traveller.xgo.one"
subapp="proxy"
repo_group="hiii_front_end"
docker_build_dir="build"
PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.pack-html.inc.sh