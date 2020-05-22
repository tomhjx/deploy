#!/bin/bash

#--------
# 部署项目：http://gitlab.hiii-life.com/hiii-big-data/event-tracking.big-data.xgo.com
#
#--------

cluster="xgo"
app="event-tracking.big-data.xgo.com"
subapp="apm"
repo_group="hiii-big-data"
repo_root="ssh://git@gitlab.hiii-life.com:19901/${repo_group}"
k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjM2UyZDYyNTRiMzAyNDUxMWIzNzdkZGJlZjdhZjM2NDUiLCJpZCI6IjM0OTU3In0.pCVwIZ0LwQef5AHQ9kHmyQvZYPsREgx_jfpYng4qxSR69rN6RR0YCZ-DJ4XGJnx224r5TJgv3oEu_bl-UohRWZKM6aVH2kge6MTqry8zApcZvVmR-saMA8KHkJbWRb0PKfNgzb2Yw_p6d28uCXFDRRXC1xUiPIpKNWyKtyZ7ShA"
docker_file_name="Dockerfile"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh
