#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/hiii-big-data/dw-job.big-data.xgo.one
#
#---------

cluster="xgo"
app="dw-job.big-data.xgo.one"
repo_group="hiii-big-data"
subapp="job-get99-jiji-city-compare"
repo_root="ssh://git@gitlab.hiii-life.com:19901/${repo_group}"
# k8s_deploy_trigger_url=""
docker_file_name="Dockerfile"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh
