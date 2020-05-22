#!/bin/bash

#--------
# 部署项目：http://gitlab.hiii-life.com/hiii_spider/deploy.jumia-hotel.spider.hiii-life.com/tree/master/hotel_list_spider
#
#--------

app="jumia-hotel.spider.hiii-life.com"
repo_group="hiii_spider"
subapp="hotel_list_spider"
repo_root="ssh://git@gitlab.hiii-life.com:19901/${repo_group}"
k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI4NzczIn0.tO0CrxpE086nnEQg523OOlZg7P84g0lcFKzwddtaeioQKGCMclCnwzAdkM2fU422aCD8xJmJcOJZ7Jjbd0ugtIvGTBmNvl26-wYto4YoSOh1b5h8t96YDGvyMe_BfC4nCdMoBtFSSKDQ3dDdoiHzhaGmWKbo5tqY3VDCHsatw4U"
docker_file_name="Dockerfile"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh
