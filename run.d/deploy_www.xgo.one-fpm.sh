#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/hiii_php/hlc.hiii-life.com
#
#---------
cluster="xgo"
app="www.xgo.one"
subapp="fpm"
repo_group="xgo/php"
docker_build_dir="build"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh

