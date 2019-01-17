#!/bin/bash                                                                           
S_PATH="$1"

source ./common/html_func.sh
source ./common/config.sh

function idm_packages {
   code "`grep ipa $1/installed-rpms | awk '{print $1}'`" "ipar" 
   code "`grep sssd $1/installed-rpms | awk '{print $1}'`" "sssdr" 
   code "`grep ssh $1/installed-rpms|awk '{print $1}'`" "sshr"
   code "`grep samba $1/installed-rpms | awk '{print $1}'`" "sambar" 
   code "`grep ntp $1/installed-rpms| awk '{print $1}'`" "ntpr" 
   code "`grep chrony $1/installed-rpms| awk '{print $1}'`" "chronyr" 
   code "`grep pki $1/installed-rpms| awk '{print $1}'`" "pkir" 
   code "`grep 389-ds $1/installed-rpms| awk '{print $1}'`" "389r" 
   code "`grep dogtag $1/installed-rpms| awk '{print $1}'`" "dogtagr" 
   code "`grep named $1/installed-rpms| awk '{print $1}'`" "namedr" 
}

