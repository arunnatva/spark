
Login:
======
kinit -kt /path/to/keytab username@REALM

Create a topic:
===============
/opt/cloudera/parcels/CDH/bin/kafka-topics --create --topic arun.topic1 --replication-factor 1 --partitions 2 --zookeeper ccycloud-2.tkreutzer.root.hwx.site:2181

Write to a topic:
=================
export KAFKA_OPTS="-Djava.security.auth.login.config=/root/kafka-test/user-client.jaas"
tail -n0 -F /var/log/hadoop-hdfs/hdfs-audit.log | /opt/cloudera/parcels/CDH/bin/kafka-console-producer --topic arun.topic1 --broker-list ccycloud-6.tkreutzer.root.hwx.site:9093 --producer.config /root/kafka-test/client.properties

Read from a topic:
==================
export KAFKA_OPTS="-Djava.security.auth.login.config=/root/kafka-test/user-client.jaas"
/opt/cloudera/parcels/CDH/bin/kafka-console-consumer --topic arun.topic1 --bootstrap-server ccycloud-6.tkreutzer.root.hwx.site:9093 --consumer.config /root/kafka-test/client.properties --from-beginning

List topics:
============
/opt/cloudera/parcels/CDH/bin/kafka-topics --list --zookeeper ccycloud-2.tkreutzer.root.hwx.site

Add ACLS to Kafka:
==================
export KAFKA_OPTS="-Djava.security.auth.login.config=/root/kafka-test/admin-client.jaas"
/opt/cloudera/parcels/CDH/bin/kafka-acls --add --allow-principal User:<username> --topic arun.topic1 --operation All --authorizer-properties zookeeper.connect=ccycloud-2.tkreutzer.root.hwx.site:2181

