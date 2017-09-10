/Spark UDF example in scala

load data from a json file into hdfs

hadoop fs -put sample.json /user/aknatva

start a spark-shell session using below command:

$ spark-shell --master yarn-client --jars /home/aknatva/pvudf/poi-3.16.jar

The financial library jar is added to class path, since one of the functions will be used in the UDF
