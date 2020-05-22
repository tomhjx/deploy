#!/bin/bash

##########
# 部署项目
#
##########


PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/inc.sh

THIS_DEPLOY_TRIGGER_URL='https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI2OTgyIn0.RoPYvnD7advQ5trDtvEIlmEknZA2sVrdnKMb_tANb11AIEcB-k2qT1cWH1l3U9kTZI_y4rX4HryfeNQRhoPI-2S49uDahSZbp-msz6Fdrd-7slp0dyWZHTsoxYBj7JFJgxyuKsMG9Hc5zC2LytFnia56opGO7Pa6WvA_74Vh3nU'

THIS_PROJECT_NAME="file.manage.hiii-life.com"

cd $DEPLOY_DIR
./run.sh push aliyun-docker ${THIS_PROJECT_NAME}:latest ./docker/${THIS_PROJECT_NAME}

say_progress_begin "更新部署配置"
kubectl apply -f etc/${THIS_PROJECT_NAME}/kubernetes/prod.yml

cd ${CURR_DIR}
if [ ! -z "${THIS_DEPLOY_TRIGGER_URL}" ]; then
    say_progress_begin "重新部署"
    curl -s ${THIS_DEPLOY_TRIGGER_URL}
fi

say_last_progress_status
