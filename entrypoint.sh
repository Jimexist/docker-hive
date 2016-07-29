#!/bin/sh
: ${HADOOP_PREFIX:=/usr/local/hadoop}
$HADOOP_PREFIX/etc/hadoop/hadoop-env.sh
rm /tmp/*.pid
# start hdfs daemon and yarn daemon
$HADOOP_PREFIX/sbin/start-dfs.sh
$HADOOP_PREFIX/sbin/start-yarn.sh
$HADOOP_PREFIX/bin/hadoop fs -mkdir -p /user/hive/warehouse
# start hive metastore
./bin/hive --service metastore &
# start hiveserver
./bin/hiveserver2
