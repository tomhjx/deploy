#!/bin/bash

##########
# 部署代理：http://gitlab.hiii-life.com/hiii/hlc.hiii-life.com
#
##########
cluster="xgo"
app="www.xgo.one"
subapp="proxy"
repo_group="xgo/php"
docker_build_dir="build"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh

