#!/bin/bash
. `dirname $0`/inc.sh

# 拉取源码
pull_src
# 构建镜像前准备工作
before_build_image
# 构建镜像
build_image
# 构建镜像后
after_build_image
# 更新k8s
pub_k8s
# 打日志
deploy_log

say_last_progress_status