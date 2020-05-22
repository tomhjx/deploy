#!/bin/bash
#-------
# 重新构建并启动服务
# 
# 查看可以使用的参数：
# ./run.sh recreate service -l
#-------

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/inc.sh

cd ${DOCKER_FILE_DIR}

if [[ '-l' == "${1}" || ! -f "${1}.yml" ]]; then
    echo "Usage:	$0 COMMAND"
    echo "Commands:"
    echo ""
    ls *.yml|xargs -I {} basename {} .yml;
    exit;
fi

yml_name=$1

docker-compose -f ${yml_name}.yml build
docker-compose -f ${yml_name}.yml down
docker-compose -f ${yml_name}.yml up -d
