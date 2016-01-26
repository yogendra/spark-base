#!/bin/bash
source "/vagrant/provision/scripts/common.sh"

function fetchScala {
	echo "fetching remote scala"
	fetch $SCALA_ARCHIVE $SCALA_MIRROR_DOWNLOAD
}

function installScala {
	echo "installing cached scala"
	FILE=${RESOURCES_ROOT}/$SCALA_ARCHIVE
	tar -xzf $FILE -C /usr/local
}

function setupScala {
	echo "setting up scala"
	ln -s /usr/local/$SCALA_VERSION /usr/local/scala
}

function setupScalaEnvVars {
	echo "creating scala environment variables"
	echo export SCALA_HOME=/usr/local/scala >> /etc/profile.d/scala.sh
	echo export PATH=\${SCALA_HOME}/bin:\${PATH} >> /etc/profile.d/scala.sh
}

echo "setup scala"
fetchScala
installScala
setupScala
setupScalaEnvVars