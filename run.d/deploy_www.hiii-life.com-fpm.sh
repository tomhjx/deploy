#!/bin/bash

##########
# 部署项目：http://gitlab.hiii-life.com/hiii/www.hiii-life.com
#
##########

THIS_PROJECT_NAME="www.hiii-life.com"
THIS_PROJECT_DOCKER_DIR_NAME="www.hiii-life.com-fpm"
THIS_PROJECT_SRC_IGNORE_FILES="{thumbfile,upgrade,uploadfile}"
THIS_DEPLOY_TRIGGER_URL="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI2NTI2In0.eVlSsLtlS3scwxaxR4Wqc493m3vQWWYzUtOpZ_McX-yQA8PbD6OpjkY-UeJvYhWcFHkRtktajsreW-RDv-owgq5hoSIy2cd2CLcc-AGA7qynsGIT8wX3OpPX365htu3lG8BdCmlQZ0gsPTcqnv_BYCqsP0EpVUpSartTCm9avAU"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.inc.sh
