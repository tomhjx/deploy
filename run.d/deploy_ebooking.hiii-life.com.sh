#!/bin/bash

##########
# 部署项目：http://gitlab.hiii-life.com/hiii/ebooking.hiii-life.com
#
##########

THIS_PROJECT_NAME="ebooking.hiii-life.com"
THIS_DEPLOY_TRIGGER_URL="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI2Mjc0In0.pP-SYUeFa5FVYjsFVEWCGPTUxtCKkxc7g1A-U3dyI4ULCpBCPF6si-Uri1xXZtSv8R7DRoTLS1LcjA3LF7Z_t_lEPHvFcT6-GlGpGbIVcO9WjK3oZn2zbYC9ADxxUHGwGJ6EHFMAn3LEIBNFZX4yOx7iQAI1lUWjc36KnohQraQ"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.inc.sh
