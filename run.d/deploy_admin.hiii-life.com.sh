#!/bin/bash

##########
# 部署项目：http://gitlab.hiii-life.com/hiii/admin.hiii-life.com
#
##########

# app="admin.hiii-life.com"
# subapp="proxy"
# repo_group="hiii"
# docker_build_dir="build"
# k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI4MTUyIn0.iRUgICmN_DdlZpIQe2WmpkWT2vTCR2p2sAZJV8L4lxSIjZUjllL-PmFdVZjzhFgtmIOvnHj6Sft6WDinrqJjclQSAp1a-iV72HrqyuqXgYcXRLP_ODAYOk_trdAdptU90HJ0mEaA9lr0r9h3ApNB_J4mQpUkFrk-lVOn0AgO3Qo"

# PARENT_DIR=`dirname $0`
# . ${PARENT_DIR}/deploy.app.inc.sh


app="admin.hiii-life.com"
subapp="proxy"
repo_group="hiii"
docker_build_dir="build"
# k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjMwMTAzIn0.KuyTwIEl2qRBUO1n_Z8y07rNN5AI4q4V5-Lac4pyAuk-gOwX0T_tQypTf5ZN0WkjlsIWI-GT6_UcDuj3EhqaZxsyHFGnQgxnflcmx0xZk-1TqAJlVfMluXvVXgm2sDJBqPz1AgZTCdMKZY61UuZxPJHq9lczRVl_Mi8lKktVSKY"
PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.pack-html.inc.sh