#!/bin/bash

#------
# 批量替换关键字
#---------

function _replace_all_files()
{
    dir=$1
    oldstr=$2
    newstr=$3
    grep ${oldstr} ${dir} -rl|xargs -I {} sed -i "" "s/${oldstr}/${newstr}/g" {}
}


_replace_all_files "./run.d" "say_progress_begin" "say_progress_begin"
_replace_all_files "./run.d" "say_last_progress_status" "say_last_progress_status"
