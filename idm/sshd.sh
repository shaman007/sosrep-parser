#!/bin/bash
S_PATH="$1"

source ./common/html_func.sh
source ./common/config.sh

function sshd {

    h2 "SSH Daemon process" "sshd"
    code "`grep sshd $S_PATH/ps`" "sshd"
}

function sshd_conf {
    h2 "SSHD configuration file" "sshdcf"
    rm_cm $1/etc/ssh/sshd_config "sshdcf"

}


