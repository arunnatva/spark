#!/bin/bash
export PYSPARK_PYTHON=/usr/bin/python3

spark-submit --master=yarn \
--files /tmp/admin-client.jaas,/tmp/kafka.keytab \
--conf "spark.driver.extraJavaOptions=-Djava.security.auth.login.config=admin-client.jaas" \
--conf "spark.executor.extraJavaOptions=-Djava.security.auth.login.config=admin-client.jaas" spark-streaming-job.py
