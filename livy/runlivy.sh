#
#submit pyspark job from livy
curl -ik --negotiate -u : -X POST -H "Content-Type: application/json" -H "X-Requested-By: hive" http://livyhost:8999/batches --data '{"conf": { "spark.jars": "file:/usr/hdp/current/hive_warehouse_connector/hive-warehouse-connector-assembly-1.0.0.3.1.0.0-78.jar","spark.submit.pyFiles": "file:/usr/hdp/current/hive_warehouse_connector/pyspark_hwc-1.0.0.3.1.0.0-78.zip"}, "file": "/user/arun/sparkhive.py"}'
#submt scala spark job from livy
curl -ik --negotiate -u : -X POST -H "Content-Type: application/json" http://livyhost:8999/batches --data '{"conf": { "spark.jars": "file:/usr/hdp/current/hive_warehouse_connector/hive-warehouse-connector-assembly-1.0.0.3.1.0.0-78.jar"},"file": "/hdfs/path/to/app.jar","className":"org.arun.spark.MainClass"}'
