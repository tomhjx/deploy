#!/bin/bash

#--------
# 部署项目：http://gitlab.hiii-life.com/hiii_spider/deploy.jumia-hotel.spider.hiii-life.com/tree/master/hotel_condition_spider
#
#--------

app="room-price-spider.hiii-life.com"
repo_group="hiii_spider"
repo_root="ssh://git@gitlab.hiii-life.com:19901/${repo_group}"
k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI4ODE0In0.MK5dEZdCodCRNDAysjQyFSi1lGLceEXoQM7rr0ku3bB7MJtpiFkge_ijfm1WQDHldvs8qIaYenx17a7IXDor0lDnK3vc9jUTflv6cGmaGyKmODZ-XJitK-q_2hq6ARn6cSEaOP3Bqe12UUjKn5oRjCof1sxVplzE0r9Uckp5G10"
docker_file_name="Dockerfile"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh
