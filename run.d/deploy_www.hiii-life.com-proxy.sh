#!/bin/bash

##########
# 部署项目：http://gitlab.hiii-life.com/hiii/www.hiii-life.com
#
##########

THIS_PROJECT_NAME="www.hiii-life.com"
THIS_PROJECT_DOCKER_DIR_NAME="www.hiii-life.com-proxy"
THIS_PROJECT_SRC_IGNORE_FILES="{WxPayPubHelper,alipay,application,config,view,sina,upgrade}"
THIS_DEPLOY_TRIGGER_URL="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI2NTI3In0.aFdn8jBXriCZYwyBmZ83qtBNqmwlIdRZ3ueNUCvWeEjCiYT43m0lrCj09piAIdIZuEb2Ar_m1I6ET8CopiIrJ_eOGPAhXmHcQgaoWImyqH6Qce4agxutDh2zgk6YRxOL-Ya5jMluGGrj30MFE8J5RPvl5YMXNEJXCbldsDRj4YY"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.inc.sh
