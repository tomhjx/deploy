#!/bin/bash

#---------
# 部署项目：http://gitlab.hiii-life.com/hiii/api.search-hotel.hiii-life.com
#
#---------

app="api.search-hotel.hiii-life.com"
subapp="fpm"
repo_group="hiii"
repo_root="ssh://git@gitlab.hiii-life.com:19901/${repo_group}"

k8s_deploy_trigger_url="https://cs.console.aliyun.com/hook/trigger?token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbHVzdGVySWQiOiJjODAzY2NmMGY0M2ZiNGZlZWFjNWI3MTUxYjU0ZWFmZjEiLCJpZCI6IjI4NjcwIn0.cgqVblbPRGXMdYKygOxP9adHI6yCqyv8H8qJEeDRrUz-SlHu1P00KAPVpWG6jnihApH19aHXEps0oRrtZk1R5DdgspIdQpe9KuoKFGP_xlGF6LdmmkKe5kr22wJ4VtAdv0lzBwQEv_UG7PugnDPjVApkfi3CTfGOgO8VBQUUg44"

docker_file_name="Dockerfile"
docker_build_dir="build"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh
