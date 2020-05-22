#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/hiii/api.saas.hiii-life.com
#
#---------

app="api.order.hiii-life.com"
subapp="fpm"
repo_group="hiii"
repo_root="ssh://git@gitlab.hiii-life.com:19901/${repo_group}"

# k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjMwODg0In0.FK-GC7gsOmdLmbfZ7NiUl8tCfeym6FNj29aikppbmo4M46fu2QaZ4elDjnw5RbjsdKi29P8sENfr1EaAilhs7TH5h1xs3xRrB8E-2kqr6RNBRxkNEGI_o1hWCM9Or5D4Xj8fpUc0on2As1S__62gcI-R90oyIovS_h8lgt_w4Z0"

docker_file_name="Dockerfile"
docker_build_dir="build"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh
