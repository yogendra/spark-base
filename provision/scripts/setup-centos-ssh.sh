#!/bin/bash
source "/vagrant/provision/scripts/common.sh"


function createDotSsh {
	echo "creating .ssh for root"
	mkdir ~/.ssh
	chmod 700 ~/.ssh
}

function setupSSHConfig {
	echo "setup ~/.ssh/config"
	cp -f $RES_SSH_CONFIG ~/.ssh
	chmod 600 ~/.ssh/*
}

echo "setup ssh"
createDotSsh
setupSSHConfig