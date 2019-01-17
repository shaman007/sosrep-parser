#!/bin/bash
#Path to the sosreport
S_PATH="$1"

source ./common/html_func.sh
source ./common/config.sh
source ./network/network.sh
source ./idm/kerberos.sh
source ./idm/packages.sh
source ./idm/samba.sh
source ./idm/sssd.sh
source ./idm/sshd.sh
source ./idm/dirsrv.sh
source ./system/res.sh
source ./system/info.sh
source ./system/messages.sh
source ./system/security.sh
source ./storage/filesystem.sh

print_header $S_PATH
h1 "Common system information" "cmh"
    sys_info $S_PATH
h1 "Filesystems" "filesysh"
    fs_df $S_PATH
h1 "Resources" "resh"
    sys_res $S_PATH
h1 "Network" "neth"
    net_ip $S_PATH
    net_route $S_PATH
    net_dns $S_PATH
    net_hosts $S_PATH
    net_nsswitch $S_PATH
h1 "IDM Packages" "idmpck"
    idm_packages $S_PATH
h1 "Kerberos" "krbh"
    krb5_conf $S_PATH
h1 "SSSD" "sssdh"
    sssd_d
    sssd_conf $S_PATH/
h1 "SSHD" "sshdh"
    sshd
    sshd_conf $S_PATH/
h1 "Samba" "sambah"
    smb_d
    smb_conf $S_PATH
h1 "Security settings" "sset"
    security $S_PATH
h1 "Log/Messages" "messagesh"
    sys_messages $S_PATH
#h1 "DIR SRV CONN" "dirsrvconnh"
#    dirsrv_access $S_PATH
h1 "Non-RH packages list" "badpkgh"
    bad_pkg $S_PATH


print_footer
print_css
