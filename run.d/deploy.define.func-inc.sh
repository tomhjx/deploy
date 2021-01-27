registry_namespace="hiii"
registry_area="cn-shenzhen"
repo_root="git@github.com:tomhjx"
com_registry="com"

case $cluster in
    'lab')
        registry_area="cn-hongkong"
        registry_namespace="tomhjx"
        ;;
esac

function deploy_log()
{
    timestamp=`date +%s.%N`  
    log_msg=${app}"|"${repo_group}"|"${src_repo_url}"|"${timestamp}"|"master"|"${tag}
    mkdir -p ~/Work/deploy/log/
    echo $log_msg >> ~/Work/deploy/log/all.log
}