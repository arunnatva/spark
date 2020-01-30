Inserting data into a Hive table failed with permission errors on hdfs folder /tmp/hive/xxxx. Issue got resolved once the folder is given access

hdfs dfs -chmod -R 777 /tmp/hive

open pyspark shell:
===================
pyspark --jars /usr/hdp/current/hive_warehouse_connector/hive-warehouse-connector-assembly-1.0.0.3.1.0.0-78.jar --py-files /usr/hdp/current/hive_warehouse_connector/pyspark_hwc-1.0.0.3.1.0.0-78.zip

$cat sparktest.py

import os,sys
from pyspark_llap import HiveWarehouseSession
from pyspark.sql import SparkSession

spark = SparkSession.builder.appName('PySparkTest').getOrCreate()
hive = HiveWarehouseSession.session(spark).build()
hive.showDatabases().show()
hive.showTables().show()

query:
mydf = hive.executeQuery("select * from t1")

create a hive table:
hive.createTable("arun_test").column("col1","string").column("col2","string").create()

write data into hive table:
mydf.write.format(HiveWarehouseSession().HIVE_WAREHOUSE_CONNECTOR).mode("append").option("table","arun_test").save()
