#!/bin/bash
CURR_DIR=$(pwd)
run_root=$(dirname $(dirname $0))

env=$1

prefix=""
if [ ! -z "${env}" ]; then
    prefix="${env}."
fi

web_service_list=(
    'api.wallet.xgo.one'
    'api.config.hiii-life.com'
    'api.gis.xgo.one'
    'api.bi.xgo.one'
    'api.honeycomb'
    'api.honeycomb-config'
    'api.honeycomb-admin'
    )

for row in "${web_service_list[@]}"; do
    cells=($row)
    project_name=${cells[0]}
    project_root=~/Work/src/web/${prefix}${project_name}
    log_path=~/Work/log/gen-apidoc-${prefix}${project_name}.log
    echo ${log_path}
    ${run_root}/run.sh exec apidocjs ${project_root}/app ${project_root}/public/apidoc/ > ${log_path} 2>&1 & 
done