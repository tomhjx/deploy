#!/bin/sh

show_help() {
    echo "Usage:	$0 COMMAND"
    echo "Commands:"
    echo ""
    curr=$PWD;
    cd `dirname $0`/run.d;
    ls *_*.sh|awk -F '_' '{print $1,$2;}'|xargs -I {} basename {} .sh;
    cd $curr;
}

if [[ -z "$1" ]]; then
    show_help;
    exit;
fi

case $1 in
    '-h' | '--help'| 'help' | 'list')
        show_help
        ;;

     * )
        if [[ -z "${2}" ]]; then
            show_help
            exit;
        fi

        root=`dirname $0`
        shellPath=${root}/run.d/${1}_${2}.sh
        shift 2
        ${shellPath} $@
        ;;

esac
