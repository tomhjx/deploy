#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/xgo/deploy.analytics-rsyslog
#
#---------

cluster="xgo"
app="analytics-rsyslog"
subapp="service"
repo_group="xgo"
docker_build_dir="build"
k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjM2UyZDYyNTRiMzAyNDUxMWIzNzdkZGJlZjdhZjM2NDUiLCJpZCI6IjY1MDM2In0.ubybqhR3FyDLT3DjM7F8mEsXhIvGIHIf0PAVC5NydJIpNUsnvmsDtN-ihWwWOAQavahDQZhJ7eB5K0uXpNyVHEEiDXQ8wHoj5H3SFUaTbNC1DAYcBt_uOEjWZLExm0DpbdQYjGYCZamiiMu195fq_sENQ7PsF7v9xY0yAA5uxhE"
PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.nosrc-app.inc.sh
