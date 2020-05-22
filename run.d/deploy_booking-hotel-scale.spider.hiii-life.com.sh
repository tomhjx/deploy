#!/bin/bash

#--------
# 部署项目：http://gitlab.hiii-life.com/hiii_spider/deploy.booking-hotel.spider.hiii-life.com/tree/master/scale
#
#--------

app="booking-hotel.spider.hiii-life.com"
repo_group="hiii_spider"
subapp="scale"
repo_root="ssh://git@gitlab.hiii-life.com:19901/${repo_group}"
k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI3Nzg0In0.Rvfr_8jgUiKQCSov_jkHPYvmx5JrmH9OyPmTqoo7YJ1q3QjGyU_ssb4cAz_JpR1xZ2yUrCCFw7MFQDRaAhVbxjvCkTrKufW4aUpGFElGJMa2ew_QcxL_cvhxow18PY1S9fV6i2GqmxDc_3un0NDg_3L5C-swwy-CTtjl4QUuvxU"
docker_file_name="Dockerfile"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh
