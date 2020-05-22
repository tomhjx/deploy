#!/bin/bash

# 定义方法
. `dirname $0`/deploy.define.func-inc.sh
. `dirname $0`/deploy.pull_src.func-inc.sh
. `dirname $0`/deploy.before_build_image.func-inc.sh
. `dirname $0`/deploy.build_image.func-inc.sh
. `dirname $0`/deploy.after_build_image.func-inc.sh
. `dirname $0`/deploy.pub_k8s.func-inc.sh

# 按策略执行
. `dirname $0`/deploy.strategy.patch-inc.sh