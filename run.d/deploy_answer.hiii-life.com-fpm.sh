#!/bin/bash

##########
# 部署项目：http://gitlab.hiii-life.com/hiii/answer.hiii-life.com
#
##########

THIS_PROJECT_NAME="answer.hiii-life.com"
THIS_PROJECT_DOCKER_DIR_NAME="answer.hiii-life.com-fpm"
THIS_PROJECT_SRC_IGNORE_FILES="{statics,install,img,uploads,data}"
THIS_DEPLOY_TRIGGER_URL="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI1OTc3In0.NoRfuxbiLnYd1Dx8FS8JlAWxxwhxKQWaeT2goTLTt4WwVs3sHqTYn2bCyc8N8RFf7inP5MEUwFjH8H0czUECfw5A5dMaf3IcYE87Wy2WQVeaS7JlHxHSwy8PlTKNNwivAnX7VsUw9lIKgkoFGK94CCwFtmw2s0IjyOr5gLRklLk"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.inc.sh
