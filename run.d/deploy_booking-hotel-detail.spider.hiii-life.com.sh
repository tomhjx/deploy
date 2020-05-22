#!/bin/bash

#--------
# 部署项目：http://gitlab.hiii-life.com/hiii_spider/deploy.booking-hotel.spider.hiii-life.com/tree/master/scale
#
#--------

app="booking-hotel.spider.hiii-life.com"
repo_group="hiii_spider"
subapp="detail"
repo_root="ssh://git@gitlab.hiii-life.com:19901/${repo_group}"
k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI5Mzc3In0.M6Q2D3p-Lff3aDSmM97oxxnwS16Pu_MuwnR1ucmWa5XjwD9m8qCnjKeiQfvayrG1KwtKEirnWlUTAODLrTRKDbFDNyP70dFS2knYP8PnqhssOGdUezSf_9FptFZAUj0TYC15w9sA3wtFHT2p9fHPnaAAkkBq3vqZrmiAxVoyhEo"
docker_file_name="Dockerfile"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh