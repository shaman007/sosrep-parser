#!/bin/bash
S_PATH="$1"

source ./common/html_func.sh
source ./common/config.sh

function smb_d {
    h2 "smbd" "smbd"
    code "`grep smb $S_PATH/ps`" "smbd"
    h2 "nmbd" "nmbd"
    code "`grep nmb $S_PATH/ps`" "nmbd"
    h2 "winbind" "winbind"
    code "`grep winbind $S_PATH/ps`" "winbind"
}

function smb_conf {
    h2 "Samba configuration file" "smbcf"
    rm_cm $1/etc/samba/smb.conf "smbcf"
}


