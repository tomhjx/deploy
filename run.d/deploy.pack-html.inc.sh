#!/bin/bash

# 定义方法
. `dirname $0`/deploy.define.func-inc.sh
. `dirname $0`/deploy.pull_src.func-inc.sh
. `dirname $0`/deploy.build_image.func-inc.sh
. `dirname $0`/deploy.after_build_image.func-inc.sh
. `dirname $0`/deploy.pub_k8s.func-inc.sh

function before_build_image()
{
   pack_dist_dir="${src_dir}/dist"
   docker_file_name="Dockerfile"
   deploy_dir=${repo_dir}
   if [ ! -z "${subapp}" ]; then
      deploy_dir="${deploy_dir}/${subapp}"
   fi

   docker_build_dir=/${docker_build_dir}

   docker_file_dir=${deploy_dir}${docker_build_dir}
   docker_file_path="${docker_file_dir}/${docker_file_name}"
   src_stage_dir="${docker_file_dir}/src"

   say_progress_begin "打包"
   ${repo_dir}/pack/build-prod.sh ${src_dir} ${pack_dist_dir}

   say_progress_begin "拷贝代码到镜像构建目录"
   info "${pack_dist_dir} ---> ${src_stage_dir}"
   mkdir -p ${src_stage_dir}
   cp -r ${pack_dist_dir}/* ${src_stage_dir}/
   find ${src_stage_dir}/ -name ".git*"|xargs rm -Rf
}

# 按策略执行
. `dirname $0`/deploy.strategy.patch-inc.sh