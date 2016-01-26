#!/bin/bash
RESOURCES_ROOT=/vagrant/provision/resources
CACHE_ROOT=$RESOURCES_ROOT/cache

#epel
EPEL_ARCHIVE=epel-release-6-8.noarch.rpm
EPEL_MIRROR_DOWNLOAD=http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
EPEL_GPG_KEY=RPM-GPG-KEY-EPEL-6
EPEL_GPG_KEY_MIRROR_DOWNLOAD=http://download.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6

#java
JAVA_VERSION=jdk1.8.0_72
JAVA_ARCHIVE=jdk-8u72-linux-x64.rpm
JAVA_MIRROR_DOWNLOAD=http://download.oracle.com/otn-pub/java/jdk/8u72-b15/jdk-8u72-linux-x64.rpm

#scala
SCALA_VERSION=scala-2.11.7
SCALA_ARCHIVE=${SCALA_VERSION}.tgz
SCALA_MIRROR_DOWNLOAD=http://downloads.typesafe.com/scala/2.11.7/scala-2.11.7.tgz

#hadoop
HADOOP_PREFIX=/usr/local/hadoop
HADOOP_CONF=$HADOOP_PREFIX/etc/hadoop
HADOOP_VERSION=hadoop-2.6.3
HADOOP_ARCHIVE=$HADOOP_VERSION.tar.gz
HADOOP_MIRROR_DOWNLOAD=http://www.eu.apache.org/dist/hadoop/common/hadoop-2.6.3/hadoop-2.6.3.tar.gz
HADOOP_RES_DIR=$RESOURCES_ROOT/hadoop

#spark
SPARK_VERSION=spark-1.6.0
SPARK_DIR=spark-1.6.0-bin-hadoop2.6
SPARK_ARCHIVE=$SPARK_VERSION-bin-hadoop2.6.tgz
SPARK_MIRROR_DOWNLOAD=http://www.us.apache.org/dist/spark/spark-1.6.0/spark-1.6.0-bin-hadoop2.6.tgz
SPARK_RES_DIR=$RESOURCES_ROOT/spark
SPARK_CONF_DIR=/usr/local/spark/conf

#ssh
SSH_RES_DIR=$RESOURCES_ROOT/ssh
RES_SSH_COPYID_ORIGINAL=$SSH_RES_DIR/ssh-copy-id.original
RES_SSH_COPYID_MODIFIED=$SSH_RES_DIR/ssh-copy-id.modified
RES_SSH_CONFIG=$SSH_RES_DIR/config

function resourceExists {
	FILE=$RESOURCES_ROOT/$1
	if [ -e $FILE ]
	then
		return 0
	else
		return 1
	fi
}

function fileExists {
	FILE=$1
	if [ -e $FILE ]
	then
		return 0
	else
		return 1
	fi
}
function fetch {
	FILE=$CACHE_ROOT/$1
	URL=$2
	if [ ! -e  $FILE ]
	then
		echo "Fetching $1 ($URL -> $FILE)"
		curl -s -o $FILE -O -L $URL $3 $4 $5 $6 $7 $8 $9
	fi
}

#echo "common loaded"
