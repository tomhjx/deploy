registry_namespace="hiii"
registry_area="cn-shenzhen"

case $cluster in
    'xgo')
        registry_area="eu-central-1"
        registry_namespace="xgoteam"
        ;;
    'xgo-test')
        registry_area="cn-hongkong"
        registry_namespace="xgoteam-test"
        ;;
esac

function deploy_log()
{
    timestamp=`date +%s.%N`  
    log_msg=${app}"|"${repo_group}"|"${src_repo_url}"|"${timestamp}"|"master"|"${tag}
    mkdir -p ~/Work/deploy/log/
    echo $log_msg >> ~/Work/deploy/log/all.log
}