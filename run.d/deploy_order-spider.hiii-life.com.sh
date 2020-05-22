#!/bin/bash

##########
# 部署项目：http://gitlab.hiii-life.com/hiii_spider/order-spider.hiii-life.com
#
##########

app="order-spider.hiii-life.com"
# subapp="task"
repo_group="hiii_spider"
repo_root="ssh://git@gitlab.hiii-life.com:19901/${repo_group}"

k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI4NTA2In0.jkaLFtsaXgjw64OCn-YtbDHLTYtU_Mm_N1q1ABYrPKzQrJQ7B3kXmY2uQJyO1xD4VMe3flD_H4CwMk9kQ2M7z3FoiS8KMcR5JJ3vIV6JecPv4L-pVC1Ica1gO6gLZ-RquzjPSI40OTzqMLGoQYGHngNnWfVgOoFpUaHJCoy5OVE"

docker_file_name="Dockerfile"
# docker_build_dir="build";

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh
