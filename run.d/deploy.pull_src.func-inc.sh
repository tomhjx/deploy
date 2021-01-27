# 拉取构建服务的源码
function pull_src()
{
    if [ -z "${repo_root}" ]; then
        failed "repo_group变量必须是合法的git仓库地址"
    fi

    if [ ! -z "${repo_group}" ]; then
        repo_root="${repo_root}/${repo_group}"
    fi

    src_repo_url="${repo_root}/${app}.git"
    src_dir=${ROOT_DIR}/deploy/repo/${app}
    repo_dir=${ROOT_DIR}/deploy/repo/deploy.${app}
    deploy_repo_url="${repo_root}/deploy.${app}.git"

    mkdir -p ${src_dir} ${repo_dir}
    say_progress_begin "git pull/clone 部署仓库"
    info "${deploy_repo_url}"
    git_checkout_master ${deploy_repo_url} ${repo_dir}

    say_progress_begin "获取当前git代码仓库最新提交日志id"
    info `get_git_latest_log_id ${repo_dir}`

    say_progress_begin "git pull/clone 代码仓库"
    info "${src_repo_url}"
    git_checkout_tag ${src_repo_url} ${src_dir}

    info "git tag ${tag}"

    info "源码仓库目录：${src_dir}"
}