#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/hiii_spider/deploy.openssh-server
#
#---------

cluster="xgo"
app="openssh-server"
subapp="service"
repo_group="hiii_spider"
docker_build_dir="build"
k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjM2UyZDYyNTRiMzAyNDUxMWIzNzdkZGJlZjdhZjM2NDUiLCJpZCI6IjQxMDA2In0.Pjf5WTLgwY8qL3mBR1mJYcgTalnRWW3Ax6BMUGMoa6yg-yJ_0zfj-wdzPwzYddjqHYJ8-Vbn723BpL6ZT4lBIp3sCkxYKJMPAKW3jVubog5w2JKTDl3t0hUcqXIPNSTeGhuYteVsOoeTO_n02LoHW7geDLmVmTxZHM4gteZWjyM"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.nosrc-app.inc.sh
