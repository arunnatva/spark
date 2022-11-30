
This project describes how to connect to a Kafka instance that is secured by SSL and also with kerberos authentication using a 
spark streaming job and also command line kafka utilties

There are two files that are crucial to be able to connect to a kerberos and SSL enabled KAFKA cluster

The security protocol should be set to SASL_SSL and in case of the spark streaming application, this property can be set in kafkaParams property object or, 
simply set it using "option" method while creating the dataframe using spark.readStream method as shown below:

mydf = spark.readStream.format("kafka") \
       .option("kafka.bootstrap.servers","broker1:9093,broker2:9093,broker3:9093") \
       .option("kafka.sasl.mechanism","GSSAPI") \
       .option("kafka.security.protocol","SASL_SSL") \
       .option("subscribe","arun.topic1") \
       .load()


The same configurations can be entered into a file as shown below, and this file can be used in kafka command line utilities to read from/ write to topics
The commands mentioned in the scripts folder will show the syntax on how to pass on below properties (client.properties)

security.protocol=SASL_SSL
sasl.kerberos.service.name=kafka
ssl.keystore.location=/opt/cloudera/security/pki/host_keystore.jks
ssl.keystore.password=Cloudera123
ssl.key.password=Cloudera123
ssl.truststore.location=/opt/cloudera/security/pki/cluster_truststore.jks
ssl.truststore.password=Cloudera123
