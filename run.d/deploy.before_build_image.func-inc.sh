# 构建镜像之前
function before_build_image()
{
    docker_file_name="Dockerfile"
    deploy_dir=${repo_dir}
    if [ ! -z "${subapp}" ]; then
        deploy_dir="${deploy_dir}/${subapp}"
    fi

    docker_build_dir=/${docker_build_dir}

    docker_file_dir=${deploy_dir}${docker_build_dir}
    docker_file_path="${docker_file_dir}/${docker_file_name}"
    src_stage_dir="${docker_file_dir}/src"

    say_progress_begin "拷贝代码到镜像构建目录"
    info "${src_dir} ---> ${src_stage_dir}"
    mkdir -p ${src_stage_dir}
    cp -r ${src_dir}/* ${src_stage_dir}/
    find ${src_stage_dir}/ -name ".git*"|xargs rm -Rf

    if [ ! -z "${ignore_src_files}" ]; then
        eval "rm -rf ${src_stage_dir}/${ignore_src_files}"
    fi
}