import sys
from pyspark import SparkConf,SparkContext
from pyspark.sql.functions import split,explode
from pyspark.sql import SparkSession
import json

#### This code illustrates spark job that accesses a hive table


## Main Starts Here.
if __name__ == "__main__":

        spark = SparkSession.builder.enableHiveSupport().getOrCreate()
        conf = SparkConf().setAppName("Oozie-spark2 smoke test")
        print "inside Main"

### Read the HIVE TABLE
        table_df = spark.sql("select * from mydb.account")
        table_df.show(3)
        table_df.write.mode('overwrite').csv(sys.argv[1])
