#!/bin/bash
S_PATH="$1"

source ./common/html_func.sh
source ./common/config.sh


function fs_df { 
    h2 "df -h output" "fs"
    code "`cat $1/df|grep -v proc|grep -v none|grep -v tmpfs|grep -v sysfs|grep -v devpts|grep -v cgroup|grep -v sunrpc|grep -v configfs|grep -v selinuxfs|grep -v debugfs|grep -v mqueue|grep -v hugetlbfs|grep -v securityfs|grep -v pstore`" "fs"
}
