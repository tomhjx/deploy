#!/bin/bash

PARENT_DIR=`dirname $0`
. ${PARENT_DIR}/inc.sh

PROJECT_ROOT_DIR=`dirname $(dirname $0)`

function install_minikube() {
    r=`which minikube`
    if [[ ! -z "$r" ]]; then
        echo "minikube 已安装"
        return
    fi

    echo "安装 minikube"

    curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64 && 
    chmod +x minikube && 
    sudo mv minikube /usr/local/bin/

    if [[ 0 != $? ]]; then
        echo "minikube 安装失败"
        exit 1
    fi

    echo "安装 minikube 完毕"
}

function install_hyperkit() {
    
    r=`which docker-machine-driver-hyperkit`
    if [[ ! -z "$r" ]]; then
        echo "hyperkit 已安装"
        return
    fi

    curl -Lo docker-machine-driver-hyperkit https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-hyperkit \
    && chmod +x docker-machine-driver-hyperkit \
    && sudo cp docker-machine-driver-hyperkit /usr/local/bin/ \
    && rm docker-machine-driver-hyperkit \
    && sudo chown root:wheel /usr/local/bin/docker-machine-driver-hyperkit \
    && sudo chmod u+s /usr/local/bin/docker-machine-driver-hyperkit


    if [[ 0 != $? ]]; then
        echo "hyperkit 安装失败"
        exit 1
    fi

    echo "安装 hyperkit 完毕"
}


function config_minikube() {
    echo "配置minikube"
    minikube config set vm-driver hyperkit
}

function start_minikube() {

    r=`minikube status|grep Running`
    if [[ ! -z "$r" ]]; then
        echo "minikube 已启动"
        return
    fi

    echo "启动minikube"
    minikube delete
    # eval $(minikube docker-env)
    minikube start
    kubectl config use-context minikube
}

function minikube_mount() {

    r=`ps -ef | grep 'minikube mount'|grep '/data1'`
    if [[ ! -z "$r" ]]; then
        echo "minikube 已挂载 ${ROOT_DIR}"
        return
    fi

    chmod -R 777  ${ROOT_DIR}/data/hiii_mysql

    echo "minikube 开始挂载 ${ROOT_DIR}"
    # 9p2000.u协议下，虚拟机挂载的目录无法被修改所有者
    # https://landley.net/kdocs/Documentation/filesystems/9p.txt
    # https://code.google.com/p/diod/wiki/protocol
    nohup minikube mount ${ROOT_DIR}:/data1 --9p-version=9p2000.L >> /dev/null  2>&1 & 
}

function deploy_ingress() {

    r=`kubectl get pod -n ingress-nginx | grep 'nginx-ingress-controller'`
    if [[ ! -z "$r" ]]; then
        echo "ingress controller 已部署"
        return
    fi
    eval $(minikube docker-env)
    docker pull quay.io/kubernetes-ingress-controller/nginx-ingress-controller:0.20.0
    kubectl create -f ${PROJECT_ROOT_DIR}/etc/kubernetes/ingress-nginx.yaml    
    echo "ingress controller 部署完毕"
}


install_minikube
install_hyperkit
config_minikube
start_minikube
minikube_mount
deploy_ingress

