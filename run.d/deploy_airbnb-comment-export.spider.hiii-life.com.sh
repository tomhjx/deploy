#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/hiii_spider/airbnb-hiii-export.spider.hiii-life.com
#
#---------

app="airbnb-hiii-export.spider.hiii-life.com"
repo_group="hiii_spider"
subapp="airbnb_comment_export"
repo_root="ssh://git@gitlab.hiii-life.com:19901/${repo_group}"
k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjM0MTg2In0.YFOS62HzD3pQU6xcTVboLHIulObaonpP5Z-uqZSm9pGiZF2j68HGeLFupDG63QtWl1-H4cHC-tyuJc83ukxb5yM2_9XTWrSitPkGhNVmWqSnzEUsxWleuBbeFu2bFMZZgj0FHkuEapF9wJUe-CB7ZYFO8CvYwCm61rsdA_fGrak"
docker_file_name="Dockerfile"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh
