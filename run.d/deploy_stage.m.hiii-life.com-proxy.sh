#!/bin/bash

##########
# 部署项目：http://gitlab.hiii-life.com/hiii/m.hiii-life.com
#
##########

THIS_PROJECT_NAME="m.hiii-life.com"
THIS_PROJECT_DOCKER_DIR_NAME="m.hiii-life.com-proxy"
THIS_PROJECT_SRC_IGNORE_FILES="{WxPayPubHelper,alipay,application,config,view,sina,upgrade}"
THIS_DEPLOY_TRIGGER_URL="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI2OTY1In0.QbQQaL0gE1cT-FFxV8lV_Djw0g4dMdrFpt_Jkxgxo0Yg8n1jVdOgCUSMYn9R6p8ybqob25Tt68lXqkfyDJx0ya5WQbKCpChVL0FQIrTDxAu9Mp3OACSXKGrTCMA-RT-ihv9gFMtRHOf9RBDW1VPKpXDzyQ5zVk6wHV2rUQkqYjo"

DEPLOY_ENV="stage"
PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.inc.sh
