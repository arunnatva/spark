hadoop fs -put -f spark_wf.xml /user/aknatva/smoketests/spark2-oozie/
hadoop fs -put -f test.py /user/aknatva/smoketests/spark2-oozie/
oozie job -run -config test.properties
