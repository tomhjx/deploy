#!/bin/bash

#--------
# 部署项目：http://gitlab.hiii-life.com/hiii_spider/deploy.jumia-hotel.spider.hiii-life.com/tree/master/hotel_list_spider
#
#--------

app="api.admin.spider.hiii-life.com"
repo_group="hiii_spider"
repo_root="ssh://git@gitlab.hiii-life.com:19901/${repo_group}"
k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjMwODcwIn0.UvLRnWXonPuYbn3tMXdnB2R1B9YVp0UwERYBC_lZ867kz3V6gaIWI-df2TrtQRPml_7QN-R2e6VZv9A9UPQoSCVP9_kUR-A3abQu_5vy96JlZ5NBIWlUNZm0OLKQVywiF9Fzpx7kvkQjtlU3ASMtRl7vFQscN6fx60czuI_K0bg"
docker_file_name="Dockerfile"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh
