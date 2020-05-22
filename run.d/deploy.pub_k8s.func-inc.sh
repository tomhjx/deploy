# 发布更新k8s服务
function pub_k8s()
{
    cd ${CURR_DIR}
    say_progress_begin "更新部署配置"

    suffix=''
    kubectl_config_params=''
    cd ~
    myroot_path=$(pwd)
    ingress_config_path="${DEPLOY_DIR}/etc/kubernetes/prod"
    cd ${CURR_DIR}
    if [ ! -z "${cluster}" ]; then
        suffix="-${cluster}"
        kubectl_config_params="--kubeconfig=${myroot_path}/.kube/${cluster}.config"
        ingress_config_path="${ingress_config_path}-${cluster}"
    fi
    ingress_config_path="${ingress_config_path}.yaml"


    k8s_config_path="${deploy_dir}/etc/kubernetes/prod.yml"
    info "k8s配置路径：${k8s_config_path}"
    info "k8s路由配置路径：${ingress_config_path}"

    if [ -f "${k8s_config_path}" ]; then
        target_k8s_config_path=${k8s_config_path}.target
        cp ${k8s_config_path} ${target_k8s_config_path}
        sed -i.bak "s?{image}?${image_registry}?g" ${target_k8s_config_path}
        kubectl apply -f "${target_k8s_config_path}" ${kubectl_config_params}
    fi
    if [ ! -z "${k8s_deploy_trigger_url}" ]; then
        say_progress_begin "重新部署"
        curl -s ${k8s_deploy_trigger_url}
    fi
    
    kubectl apply -f "${ingress_config_path}" ${kubectl_config_params}

}