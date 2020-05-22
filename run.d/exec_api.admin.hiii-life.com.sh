#!/bin/bash

##########
# 在docker实例中执行命令，实例属于该项目 http://gitlab.hiii-life.com/hiii/api.admin.hiii-life.com
#
##########

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/inc.sh

cmd=$@
docker exec -it hiii_admin_php bash -c "${cmd}"
