#!/bin/bash

S_PATH="$1"

source ./common/html_func.sh
source ./common/config.sh

function net_dns {

    h2 "DNS information" "dns"
    rm_cm $1/etc/resolv.conf "dns"
}

function net_hosts {

    h2 "Hosts file" "hosts"
    rm_cm $1/etc/hosts "hosts"
}

function net_nsswitch {

    h2 "NS Switch" "switch"
    rm_cm $1/etc/nsswitch.conf "switch"

}

function net_ip {

    h2 "Network adresses" "netip"
    code "`cat $1/ip_addr | grep -v 127.0.0.1 | grep -v ::1/128|grep -v LOOPBACK`" "netip"
}

function net_route {
    h2 "Routing" "route"
    code "`cat $1/route`" "route"
}


