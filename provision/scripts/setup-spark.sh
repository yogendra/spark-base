#!/bin/bash
source "/vagrant/provision/scripts/common.sh"

function fetchSpark {
	echo "fetch spark from remote file"
	fetch $SPARK_ARCHIVE $SPARK_MIRROR_DOWNLOAD
}

function installSpark {
	echo "install spark"
	FILE=$CACHE_ROOT/$SPARK_ARCHIVE
	tar -xzf $FILE -C /usr/local
	ln -s /usr/local/$SPARK_DIR /usr/local/spark
}

function setupSpark {
	echo "setup spark"
	cp -f $RESOURCES_ROOT/spark/slaves /usr/local/spark/conf
	cp -f $RESOURCES_ROOT/spark/spark-env.sh /usr/local/spark/conf
}

function setupSparkEnvVars {
	echo "creating spark environment variables"
	cp -f $SPARK_RES_DIR/spark.sh /etc/profile.d/spark.sh
}

echo "setup spark"
fetchSpark
installSpark
setupSpark
setupSparkEnvVars