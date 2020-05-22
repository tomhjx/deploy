#!/bin/bash

. `dirname $0`/inc.sh

help="./run.sh read ini 文件路径 节点名称 属性名称"

check_help "$1" "$help"

path=$1
section=$2
item=$3

r=`cat $path | grep -v "^\s*;" | awk -F '=' '/\['$section'\]/{a=1}a==1&&$1~/'$item'/{print $2;exit}'`
echo $r
