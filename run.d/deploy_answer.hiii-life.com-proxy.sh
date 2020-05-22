#!/bin/bash

##########
# 部署项目：http://gitlab.hiii-life.com/hiii/answer.hiii-life.com
#
##########

THIS_PROJECT_NAME="answer.hiii-life.com"
THIS_PROJECT_DOCKER_DIR_NAME="answer.hiii-life.com-proxy"
THIS_PROJECT_SRC_IGNORE_FILES="{app,caches,img,install,resources,system,template,data}"
THIS_DEPLOY_TRIGGER_URL="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI1OTg2In0.CIe9XmYFoN037LFhe3HStsE9b77tLgHAFx8jTJSTz14WRC6V6NFsEgfXdHlEpAgjF6K7tMD28xE5IVgEg_PAmI10VnmLF4AhMBd-rI_oVkeBTBg0xdmnt-_Z8Nu5HeucWRAVDFUoqwRYmWZAM2TsXGKG2kjlKwdVsA1jS9H0pow"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.inc.sh
