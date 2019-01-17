#!/bin/bash
S_PATH="$1"

source ./common/html_func.sh
source ./common/config.sh

function krb5_conf {
    h2 "NTP/chrony daemon in process list:" "ntp"
    code "`grep ntp $S_PATH/ps` `grep chrony $S_PATH/ps` " "ntp"
    h2 "Configuration file:" "krbcf"
    rm_cm $1/etc/krb5.conf "krbcf"
    h2 "/etc/krb5.keytab listing" "keytab"
    code "`cat $1/sos_commands/krb5/klist_-ket_.etc.krb5.keytab `"
}


