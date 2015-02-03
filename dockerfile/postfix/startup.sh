#!/bin/bash
if [ ! -f /etc/postfix/main.cf ]; then
    net=$(ip addr | grep eth0 | grep inet | sed s/"\/"/" "/g | awk '{print $2}' | sed s/"\."/" "/g | awk '{print $1"."$2"."$3"."0}')
    mask=$(ip addr | grep eth0 | grep inet | sed s/"\/"/" "/g | awk '{print $3}')
	echo $net
	echo $mask
    # DEPLOY DEFAULT CONFIG
    cd / && tar xvfz postfix.tgz
    # POSTFIX CONFIG
    postconf -e myhostname=cloudogu.com
    postconf -e mydestination="cloudogu.com, example.com, localhost.localdomain, localhost"
    postconf -e mynetworks="127.0.0.0/8 $net/$mask [::ffff:127.0.0.0]/104 [::1]/128"

fi

# START POSTFIX
/usr/lib/postfix/master -d -c /etc/postfix >>/var/log/postfix.log 2>&1
