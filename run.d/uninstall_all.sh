#!/bin/bash
#------
# 删除hiii服务
#
#------

docker ps -a|grep hiii|awk '{print $1}'|xargs docker stop|xargs docker rm
