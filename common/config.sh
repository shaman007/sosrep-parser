#!/bin/bash
source ./common/html_func.sh

function rm_cm {

#the expression removes # and ; comments from the config. I use two separate expressions so it would be more easy to remove one of in in case we need to presserver ;-comments

    if [ -f $1 ]; then
        if [[ $(cat $1 | grep -v '^$\|^\s*\#' | grep -v '^$\|^\s*\;') ]]; then
            code  "`cat $1 | grep -v '^$\|^\s*\#' | grep -v '^$\|^\s*\;'`" "$2"
            fi
    fi
}
