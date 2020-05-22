#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/xgo/deploy.elastalert
#
#---------

cluster="xgo"
app="elastalert"
repo_group="hiii-big-data"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.nosrc-app.inc.sh
