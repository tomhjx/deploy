#!/bin/bash
#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/hiii/api.saas.hiii-life.com
#
#---------

cluster="xgo"
app="mongo-express"
subapp="service"
repo_group="xgo"
docker_build_dir="build"
k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjM2UyZDYyNTRiMzAyNDUxMWIzNzdkZGJlZjdhZjM2NDUiLCJpZCI6IjQwNTg4In0.TTfjemtY46ly7Z3BqK_3xk427TINbIPIvPfoQnO2QVABa6g-0_IGbUl3BgBCjdRHrlj_AdPHTdBfP88AiSTt4Zn5RveFif5dO0fd4q6JqqnWEDz9s1nx2lq5En-mciOU2-FRmWrbwVHYNvjXrU_nSOIXELFO50C4_-VILj1myas"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.nosrc-app.inc.sh
