#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/hiii/api.admin.hiii-life.com
#
#---------

app="api.admin.hiii-life.com"
subapp="task"
repo_group="hiii"
repo_root="ssh://git@gitlab.hiii-life.com:19901/${repo_group}"
# https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI4NTAzIn0.jjUdFv3VWdYYDd2Z_QKQxkG6iHNAHwMw3Jk219FjdwIjyDEVGTB4GpvAxlBKsEUmj5lWeWFcCqtNGkWWBh3mNzO3g236k0Hw5xriMwPFxuriobWls3LucEw5oef8_H_ipFuIyyBs3VgElFaDBnz_45Q1G1NlTVtlhsr5O6MnfBM
# https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI4NTA0In0.mtYFGqrTG-67CZn8aG6t5wzEs4wraOqjU6_tRXUYMbOTSEM59vuSWjGBSqJmFWhKIKdTaGnBg4L8ltDJkwL6Yjarn4maOwPRfi48K8grLHcT2TqilEqBd-fNe0XI53-g55Wi0PCnpGEUlZg7I-sWsUGWRyfJCtK1RWbW2JDZiD4

# k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI4MTE4In0.fPUSpFF8Tj1-Eq847h85pNRnMjwYrYxi8iYwF07P61-l1f7Fgk0I_r1QgTKsuRmLJHMnI-bjcCmhVhEF8EnFgghCGInrw95_aVR5N3d3xHAlvGEbop-wnhNlObYjsjhrFK0Y4gVIJPJUTrEqo6jmXqhVr-T7movD4Sy8sx9039Y"
docker_file_name="Dockerfile"
docker_build_dir="build";

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh
