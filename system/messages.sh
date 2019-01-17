#!/bin/bash
S_PATH="$1"

source ./common/html_func.sh
source ./common/config.sh

function sys_messages {
    array=(`cat $1/var/log/messages | awk '{ print $5 }'| sed 's/\[[0-9].*$//'|sed 's/\[/\\\[/g' | sed 's/\]/\\\]/g'| sed 's/://g' |sort -u`)
    len=${#array[*]}
    i=0
    while [ $i -lt $len ]; do
        h2 `echo "${array[$i]}" | sed 's/\\\//g' ` "`echo "${array[$i]}"|sed 's/\[//g' | sed 's/\]//g' |sed 's/\\\//g'`"
	code "`grep -i ${array[$i]} $1/var/log/messages`" "`echo "${array[$i]}"|sed 's/\[//g' | sed 's/\]//g' | sed 's/\\\//g' `"
        let i++
    done
}
