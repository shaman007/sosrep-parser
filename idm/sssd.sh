#!/bin/bash
S_PATH="$1"

source ./common/html_func.sh
source ./common/config.sh

function sssd_d {

    h2 "SSS Daemon process" "sssdd"
    code "`grep sssd $S_PATH/ps`" "sssdd"
}

function sssd_conf {
    h2 "SSSD configuration file" "sssdcf"
    rm_cm $1/etc/sssd/sssd.conf "sssdcf"

}


