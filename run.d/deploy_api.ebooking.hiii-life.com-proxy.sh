#!/bin/bash

##########
# 部署代理：http://gitlab.hiii-life.com/hiii/api.ebooking.hiii-life.com
#
##########

THIS_PROJECT_NAME="api.ebooking.hiii-life.com"
THIS_PROJECT_DOCKER_DIR_NAME="api.ebooking.hiii-life.com-proxy"
THIS_DEPLOY_TRIGGER_URL="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI2MjYyIn0.IXxHbuQH8mhIQPq1hS3Yu3TytuYT_lm5UUD2FXvKK9rV2GzEhQWZqn2s9pb7O5mD04SJO127b8FdneWczZl_sk2qBF3edCzcJzAbbGZSouodiSH029hDEGntiBS8hLWoPBB4ZP8DZz3wS6o39p76IVCyhMmR00_Bw7Tk8yRpBmo"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.inc.sh
