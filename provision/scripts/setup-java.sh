#!/bin/bash
source "/vagrant/provision/scripts/common.sh"

function fetchJava {
	echo "fetch oracle jdk"

	fetch $JAVA_ARCHIVE $JAVA_MIRROR_DOWNLOAD -b "oraclelicense=a" -b "oraclelicense=accept-securebackup-cookie"
}

function installJava {
	echo "install oracle jdk"
	FILE=$CACHE_ROOT/$JAVA_ARCHIVE
	yum --nogpgcheck -y localinstall $FILE
}

function setupJava {
	echo "setup java"

}

function setupJavaEnvVars {
	echo "creating java environment variables"
	echo export JAVA_HOME=/usr/java/$JAVA_VERSION >> /etc/profile.d/java.sh
	echo export PATH=\${JAVA_HOME}/bin:\${PATH} >> /etc/profile.d/java.sh
}

echo "setup java"
fetchJava
installJava
setupJava
setupJavaEnvVars