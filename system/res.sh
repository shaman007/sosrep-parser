#!/bin/bash
S_PATH="$1"

source ./common/html_func.sh
source ./common/config.sh

function sys_res {
    code "`cat $1/free`" "res"
    echo "<pre><code>"
    echo "<b>Open files count:</b> `cat $1/lsof| wc -l`"
    echo "<b>Process count:</b> `cat $1/ps| wc -l`"
    echo "<b>Zombies</b>:`cat $1/ps | awk '{ print $8 }'|grep Z|wc -l`"
    echo "<b>Uninteraptable sleep</b>:`cat $1/ps | awk '{ print $8 }'|grep P|wc -l`"
    echo "<b>Uptime</b>: `cat $1/uptime`"
    echo "</code></pre>"
    h2 "Sysctl"
    rm_cm "$1/etc/sysctl.conf" "res_syctl"
    rm_cm_d "$1/etc/sysctl.d/*"
}


