#!/bin/bash
#----------
# 生成 api doc
#
#
#----------

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/inc.sh


src=$1
dst=$2

docker pull jujhars13/docker-node-apidocjs

docker run --rm \
-v ${src}:/app \
-v ${dst}:/output \
jujhars13/docker-node-apidocjs \
apidoc -i /app -o /output
