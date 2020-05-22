#!/bin/bash
##########
# 根据输入的字符串生成md5码
#
##########

if which md5 >/dev/null 2>&1; then 
    echo -n "${1}" | md5
elif which md5sum >/dev/null 2>&1; then 
    echo -n "${1}" | md5sum |cut -c 1-32
else 
    exit 1;
fi