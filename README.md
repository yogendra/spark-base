# Spark Base: Spark Basebox for  Vagrant VMWare Provider

This is a Vagrant base box for creating Hadoop and Spark cluster.

## Installation

Best way to get started with this box is to use [spark-cluster](http://github.com/yogendra/spark-cluster) repo. Please see more details on that project.


##Components
It has following pre-installed:
* Java 1.8
* Scala 2.11.7
* R 1.6
* Hadoop 2.6.5
* Spark 1.6.0

##Credits
This box is primarily based on work by [Jee Vang](https://github.com/vangj). His work on [hadoop-spark](vagrant-hadoop-2.4.1-spark-1.0.1) box was extremely helpful in making this box possible. Thanks.


I took that box design and created it into a base box. I also removed some provisioning steps around hosts file generation. I find using [landrush](https://github.com/phinze/landrush) easier.


## How to build?
If you wish to make changes in this base box for some reason, then you can clone this repo, and use make commands to build box locally.

*You may need to update path to VMWare Disk Manager if you VMWare Fusion is installed on some non standard location*

```shell
git clone git@github.com:yogendra/spark-base.git
cd spark-base
make
```

## Derived boxes
1. [Spark Cluster](http://github.com/yogendra/spark-cluster)

(Post your derived box links in Issues/PR)