#!/bin/bash
/bin/bash /etc/bootstrap.sh

echo "leaving namenode safemode..."
$HADOOP_PREFIX/bin/hdfs dfsadmin -safemode leave

echo "making directory for Hive metastore"
$HADOOP_PREFIX/bin/hadoop fs -mkdir -p /user/hive/warehouse

echo "starting metastore"
./bin/hive --service metastore &

echo "starting hive server2"
./bin/hiveserver2
