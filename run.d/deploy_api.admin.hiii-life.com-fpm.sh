#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/hiii/api.admin.hiii-life.com
#
#---------

app="api.admin.hiii-life.com"
subapp="fpm"
repo_group="hiii"
docker_build_dir="build"
k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI4MTQxIn0.ofT_Q94utRMG5V3iz7XEfcsHcALau7q80SP_GNQTwj8yb-Pk1wS2ncJBZ8e5rUaUQrZwEQ25wleoU_zahhCVcXeGgq_nOr40lYYLQvR7xHZ2o9_vUZuwHVHxnHk_bGjt2jXfJZWYCQX9cxVnLS1oI-tv-X4BcI2QfTNqC7pnFvA"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh
