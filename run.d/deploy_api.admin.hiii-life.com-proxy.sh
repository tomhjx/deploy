#!/bin/bash

##########
# 部署代理：http://gitlab.hiii-life.com/hiii/api.admin.hiii-life.com
#
##########

THIS_PROJECT_NAME="api.admin.hiii-life.com"
THIS_PROJECT_DOCKER_DIR_NAME="api.admin.hiii-life.com-proxy"
THIS_DEPLOY_TRIGGER_URL="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI4MTQwIn0.ge5eRgLEggg5alYj8FxmLpoTi2QUTDINxT1HLBoX5XGOqb6hOmGJ9WeSJq3MCMhqP0EAit2eeeIDTdY36dHQTucA9VijQCrlQ1tdkE2yHf15foB1L91rq4eTRtGqzBMVf910rrKCXF48OjlDvLubyGc5T2DDNkU40UcH8Wr73GM"
PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.inc.sh
