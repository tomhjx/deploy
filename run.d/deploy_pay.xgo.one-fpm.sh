#!/bin/bash

cluster="xgo"
app="pay.xgo.one"
subapp="fpm"
repo_group="xgo"
docker_build_dir="build"

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/deploy.app.inc.sh
