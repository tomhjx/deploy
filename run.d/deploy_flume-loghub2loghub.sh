#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/hiii-big-data/deploy.flume-loghub.big-data.xgo.com
#
#---------

cluster="xgo"
app="flume-loghub.big-data.xgo.com"
repo_group="hiii-big-data"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.nosrc-app.inc.sh
