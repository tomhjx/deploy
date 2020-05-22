#!/bin/bash

##########
# 部署项目：http://gitlab.hiii-life.com/hiii/m.hiii-life.com
#
##########

app="m.hiii-life.com"
subapp="fpm"
repo_group="hiii"
docker_build_dir="build"
k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI2NDM5In0.TiOzsMcbzPWEcF3U_NzawRxBydp0D6t4_QPcZfDBmSg7tLBV_Dg6Kmjq4vFy3wsabhwGhAoGe1oDm55tlFfJzZBcVxfcHpoKGhdIU7dhOtVOCjaXI2YPghqw_aqd-lcr1ONq_9NMp1SEqEtviGc3T0DRu6AOVnn5H2nEqpkdhI4"
ignore_src_files="{thumbfile,upgrade,uploadfile}"
PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh