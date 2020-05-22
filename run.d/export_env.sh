#!/usr/bin/env bash

#执行完此脚本，需要重启机器才生效
#查看本地环境变量：env | grep "DEV\|TEST"

CUR_DIR=`dirname $0`
APP_ENV_PATH="${CUR_DIR}/../etc/sys/app.env"
APP_BASH_PATH=/etc/profile.d/xgo-app-env.sh

#清空文件
> ${APP_BASH_PATH}
cat ${APP_ENV_PATH} | while read line
do
    #过滤空行、注释
    if [[ -z ${line} || ${line} == \#* ]]
    then
        continue
    fi
    echo "export ${line}" >> ${APP_BASH_PATH}
done