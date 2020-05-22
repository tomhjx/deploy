#!/bin/bash

##########
# 部署项目：http://gitlab.hiii-life.com/hiii/api.ebooking.hiii-life.com
#
##########

THIS_PROJECT_NAME="api.ebooking.hiii-life.com"
THIS_PROJECT_DOCKER_DIR_NAME="api.ebooking.hiii-life.com-fpm"
# THIS_PROJECT_LOCAL_BUILD=1
THIS_PROJECT_SRC_IGNORE_FILES="deploy"
THIS_DEPLOY_TRIGGER_URL="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI2MjU0In0.BXYT3OW6zIl8leAYvN7YiurUwFj9RrAPqWdEYgDG5FULu5Y8xkJ7pYTVxDtYOAaqleSe9qZPvbrrrymIxvA4W3M6kiX7NKV4erqaPSp0aojw-cRu71QTBRlVi816vdXSNN76J4Pwl1Rt8PQ0GqYPBE8sG-MgUGz3etAAoAmDExE"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.inc.sh
