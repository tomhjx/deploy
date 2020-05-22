#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/hiii/api.supplier.hiii-life.com
#
#---------

app="api.supplier.hiii-life.com"
subapp="proxy"
repo_group="hiii"
repo_root="ssh://git@gitlab.hiii-life.com:19901/${repo_group}"

docker_file_name="Dockerfile"
docker_build_dir="build"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh