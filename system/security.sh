#!/bin/bash
S_PATH="$1"

source ./common/html_func.sh
source ./common/config.sh

function security {
    h2 "Access list"
    rm_cm "$1/etc/security/access.conf" "accl"
    h2 "Limits"
    rm_cm "$1/etc/security/limits.conf" "limits"
    rm_cm_d "$1/etc/security/limits.d/*"
}
