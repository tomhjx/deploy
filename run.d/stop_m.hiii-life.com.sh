#!/bin/bash
##########
# 停止服务 http://gitlab.hiii-life.com/hiii/m.hiii-life.com
#
##########

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/inc.sh

say_progress_begin "停止docker实例"

docker-compose -f ${DEPLOY_DIR}/docker/booking.yml down

say_last_progress_status
