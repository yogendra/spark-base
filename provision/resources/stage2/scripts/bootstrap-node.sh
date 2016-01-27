#!/bin/bash
MODE=$1

if [ "x$1" == "x" ]; then
	echo "No MODE provided"
	exit 1
end

MODE=$(echo $MODE |echo "$a" | tr '[:upper:]' '[:lower:]')
echo "Bootstraping node as $MODE"

#ssh
MASTER_SSH_AUTHORIZED_KEYS=/vagrant/authorized_keys


function createSSHKey {
	echo "generating ssh keys for user $USER"
	ssh-keygen -t rsa -P "" -f ~/.ssh/id_rsa
	cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
}

function exportSSHKey {
	echo "export public ssh key"
	cat ~/.ssh/id_rsa.pub >> $MASTER_SSH_AUTHORIZED_KEYS
}

function appendAuthorizedKeys {
	if [  -e $MASTER_SSH_AUTHORIZED_KEYS ]
	then
		cat $MASTER_SSH_AUTHORIZED_KEYS ~/.ssh/authorized_keys | uniq > ~/.ssh/authorized_keys.updated
		mv ~/.ssh/authorized_keys.update ~/.ssh/authorized_keys
	fi
	chmod 600 ~/.ssh/authorized_keys
}

function setupMaster {
	echo "creating keys"
	createSSHKey
	exportSSHKey
	$(dirname $0)/setup-centos-ssh-master.sh
}

function setupSlave {
	echo "append authorized keys"
	appendAuthorizedKeys

}

echo "setup ssh"
if [ $MODE == "master"]; then
	setupMaster
elif [ $MODE == "slave" ]; then
	setupSlave
else
	echo "Error in bootstraping node. Unknown mode [$MODE] requested"
	exit 1
fi