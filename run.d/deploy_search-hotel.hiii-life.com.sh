#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/hiii_front_end/search-hotel.hiii-life.com
#
#---------

app="search-hotel.hiii-life.com"
subapp="proxy"
repo_group="hiii"
docker_build_dir="build"
k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjMwOTUwIn0.J_il7Ln44zhO0LzDqF05f0Dz3B2yDlBmyQFj9NlCKRpYVTKlOxG45S7GSvt-ZEam-qLOeg2fpSZ4ICAwkn0jlwF02pZufTguCUzxlw_8sm624HJ-2Wtgh8NHXYz7Hjhdicf1pOzcc8vAVnedpF3ZNJHRMPSShgQeit__W3iFzf4"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.pack-html.inc.sh
