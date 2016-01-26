#!/bin/bash
source "/vagrant/provision/scripts/common.sh"

function fetchJava {
	echo "installing and caching oracle jdk"
	fetch $JAVA_ARCHIVE $JAVA_MIRROR_DOWNLOAD -H "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie"
}

function installJava {
	echo "installing cached oracle jdk"
	FILE=$CACHE_JAVA/$JAVA_ARCHIVE
	yum --nogpgcheck -y localinstall $FILE
}

function setupJava {
	echo "setting up java"

}

function setupJavaEnvVars {
	echo "creating java environment variables"
	echo export JAVA_HOME=/usr/local/java >> /etc/profile.d/java.sh
	echo export PATH=\${JAVA_HOME}/bin:\${PATH} >> /etc/profile.d/java.sh
}

echo "setup java"
fetchJava
installJava
setupJava
setupJavaEnvVars