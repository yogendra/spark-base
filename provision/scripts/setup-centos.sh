#!/bin/bash
source "/vagrant/scripts/common.sh"

function disableFirewall {
	echo "disabling firewall"
	service iptables save
	service iptables stop
	chkconfig iptables off
}

function enableEPEL {
	echo "Enabling EPEL repository"
	yum -q -y install epel-release
}

function runPackageUpdate {
	echo "updating packages"
	yum -q -y update
}


echo "setup centos"

disableFirewall
enableEPEL
runPackageUpdate