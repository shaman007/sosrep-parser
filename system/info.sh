#!/bin/bash
S_PATH="$1"

source ./common/html_func.sh
source ./common/config.sh


function sys_info {

    echo "<p>"
    echo "<b>Release version:</b> `cat $1/etc/redhat-release`<br />"
    echo "<b>System date:</b> `cat $1/date`<br />"
    echo "<b>Current date:</b> `date`<br />"
    echo "<b>Hostname:</b> `cat $1/hostname`<br />"
    echo "<b>SELinux status:</b> `grep \"SELinux status:\" $1/sos_commands/selinux/sestatus_-b | awk '{print $3}'` <br />"
    echo "<b>SELinux mode:</b> `grep \"Current mode:\" $1/sos_commands/selinux/sestatus_-b | awk '{print $3}'` <br />"
    echo "</p>"
}

function bad_pkg {
    code "`grep -v "el7" $1/installed-rpms |grep -v "el6"| awk '{print $1, $8}' | sort -k2`" "badbkgs"
}
