import os,sys
from pyspark_llap import HiveWarehouseSession
from pyspark.sql import SparkSession

spark = SparkSession.builder.appName('PySparkTestHWC').enableHiveSupport().getOrCreate()
hive = HiveWarehouseSession.session(spark).build()
hive.showDatabases().show()
hive.executeQuery("select * from test_tbl limit 10").show()
