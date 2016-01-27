#!/bin/bash
source "/vagrant/provision/scripts/common.sh"

function setupSSHConfig {
	echo "setup ~/.ssh/config"
	cp -f $RES_SSH_CONFIG ~/.ssh
}
echo "setup ssh"
setupSSHConfig