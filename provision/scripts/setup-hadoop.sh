#!/bin/bash
source "/vagrant/provision/scripts/common.sh"
function fetchHadoop {
	echo "fetch hadoop"
	fetch $HADOOP_ARCHIVE $HADOOP_MIRROR_DOWNLOAD
}

function installHadoop {
	FILE=$CACHE_ROOT/$HADOOP_ARCHIVE
	tar -xzf $FILE -C /usr/local
	ln -s /usr/local/$HADOOP_VERSION /usr/local/hadoop
}

function setupHadoop {
	echo "creating hadoop directories"
	mkdir /var/hadoop
	mkdir /var/hadoop/hadoop-datanode
	mkdir /var/hadoop/hadoop-namenode
	mkdir /var/hadoop/mr-history
	mkdir /var/hadoop/mr-history/done
	mkdir /var/hadoop/mr-history/tmp

	echo "copying over hadoop configuration files"
	cp -f $HADOOP_RES_DIR/* $HADOOP_CONF
}

function setupHadoopEnvVars {
	echo "creating hadoop environment variables"
	cp -f $HADOOP_RES_DIR/hadoop.sh /etc/profile.d/hadoop.sh
}


echo "setup hadoop"
fetchHadoop
installHadoop
setupHadoop
setupHadoopEnvVars