# 构建镜像

function build_image()
{
    say_progress_begin "生成镜像构建文件"

    if [ -z "${subapp}" ]; then
        image_name=${app}
    else
        image_name="${app}-${subapp}"
    fi

    if [ -z "${is_com_registry}" ]; then
        image_local_tag="${image_name}:${tag}"
    else
        image_local_tag="com:${image_name}..${tag}"
    fi

    image_tag="${image_local_tag}"

    cd ${DEPLOY_DIR}
    info "构建镜像的工作目录路径：${docker_file_dir}"
    docker build -t ${image_local_tag} ${docker_file_dir} -f ${docker_file_path} 

    if [ -z "${is_local_build}" ]; then
        say_progress_begin "镜像打tag"
        digests=$(docker inspect -f '{{.Parent}}{{.RootFS.Layers}}' "${image_local_tag}")
        digests=$(${DEPLOY_DIR}/run.sh get md5 "${digests}"|cut -c 1-13)
        image_tag="${image_local_tag}-${digests}"
        image_full_tag="registry.${registry_area}.aliyuncs.com/${registry_namespace}/${image_tag}"
        
        docker tag ${image_local_tag} ${image_full_tag}
        image_registry="registry-vpc.${registry_area}.aliyuncs.com/${registry_namespace}/${image_tag}"
        info "镜像地址：${image_registry}"
        ./run.sh login aliyun-docker ${registry_area}
        docker push ${image_full_tag}
    fi

}