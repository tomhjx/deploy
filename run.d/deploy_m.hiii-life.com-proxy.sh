#!/bin/bash

##########
# 部署项目：http://gitlab.hiii-life.com/hiii/m.hiii-life.com
#
##########

app="m.hiii-life.com"
subapp="proxy"
repo_group="hiii"
docker_build_dir="build"
k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI2NDM4In0.FPDns_SnfsGE7tqySvxe7STSpUuUv5RacHb3aptGHbS4P7hFgNVGX3p6Z8uN_vjk-2nn7kI7zjRVeG2DS7K2akeYJzTeiMd8x5TOh3he_h79FbRnn0qyEbxAYjA2cCVMlqL7ju1ljoqlVvxgHa4Cf84843f6w_pykuXzdPb-hd4"

ignore_src_files="{upgrade,WxPayPubHelper,application,config,config.prod,paypal,phpqrcode,sina,view,thumbfile,uploadfile}"
PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh