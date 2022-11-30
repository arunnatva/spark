import os,sys
import time
#from kafka import kafkaConsumer
#from kafka import kafkaProducer
from pyspark.sql import SparkSession
from pyspark.sql.types import *
from pyspark.sql.functions import *


os.environ['PYSPARK_SUBMIT_ARGS'] = '--packages org.apache.spark:spark-streaming-kafka-0-8_2.11:2.1.0,org.apache.spark:spark-sql-kafka-0-10_2.11:2.1.0 pyspark-shell'
os.environ["PYSPARK_PYTHON"]="/usr/bin/python3"


from ast import literal_eval

spark = SparkSession.builder.appName("SSfromKafkaApp").getOrCreate()

mydf = spark.readStream.format("kafka") \
       .option("kafka.bootstrap.servers","ccycloud-6.tkreutzer.root.hwx.site:9093,ccycloud-7.tkreutzer.root.hwx.site:9093,ccycloud-8.tkreutzer.root.hwx.site:9093") \
       .option("kafka.sasl.mechanism","GSSAPI") \
       .option("kafka.security.protocol","SASL_SSL") \
       .option("subscribe","arun.topic1") \
       .load()

#mydf.show()
querydf = mydf.writeStream.format("console").start()

querydf.awaitTermination()
