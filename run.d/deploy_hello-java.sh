#!/bin/bash

##########
# 部署项目：https://github.com/tomhjx/hello-java
#
##########

cluster="lab"
app="hello-java"
subapp="service"
repo_group="tomhjx"
docker_build_dir="build"
PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.pack-service.inc.sh