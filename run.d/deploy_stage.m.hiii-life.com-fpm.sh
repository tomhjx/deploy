#!/bin/bash

##########
# 部署项目：http://gitlab.hiii-life.com/hiii/m.hiii-life.com
#
##########

THIS_PROJECT_NAME="m.hiii-life.com"
THIS_PROJECT_DOCKER_DIR_NAME="m.hiii-life.com-fpm"
THIS_PROJECT_SRC_IGNORE_FILES="{thumbfile,upgrade,uploadfile}"
DEPLOY_ENV="stage"
THIS_DEPLOY_TRIGGER_URL="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI2OTY0In0.IZoXAtCdD_Ymiq-6qolOHrsU8vHP_huH6evJSzwwV4VRjVdYijiHhJTHCVXN7EsQgI7LV1Mfc9w3EaY9emE0lspPHQDhmaXjdpQ8XtdCLR6fJOssWpciPOo3iNUprP6WTwKJoOqUQ0g2DQoLna-Xxv7bwWXZrWfHsAPEHwPgo7A"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.inc.sh
