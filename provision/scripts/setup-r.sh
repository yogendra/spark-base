#!/bin/bash
source "/vagrant/scripts/common.sh"
function installR {
	echo "Installing R "
	yum -q -y install R
}

function setupREnvVars {
	echo "R_HOME=/usr/local/R" >> /etc/profile.d/r.sh
}

echo "setup R"
installR
setupREnvVars