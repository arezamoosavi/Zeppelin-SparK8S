FROM apache/zeppelin:0.10.0

# install spark
RUN curl -o spark-3.2.1-bin-hadoop3.2-scala2.13.tgz https://downloads.apache.org/spark/spark-3.2.1/spark-3.2.1-bin-hadoop3.2-scala2.13.tgz && \
    tar -xzvf spark-3.2.1-bin-hadoop3.2-scala2.13.tgz && \
    rm -rf spark-3.2.1-bin-hadoop3.2-scala2.13.tgz

RUN mv spark-3.2.1-bin-hadoop3.2-scala2.13 /opt/zeppelin/spark

ENV SPARK_HOME=/opt/zeppelin/spark
ENV PATH=$PATH:$SPARK_HOME/bin
ENV PATH=$PATH:$SPARK_HOME/sbin
ENV PYTHONPATH=$SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.10.9.3-src.zip:$PYTHONPATH

COPY conf/interpreter-setting.json /opt/zeppelin/interpreter/spark/interpreter-setting.json
COPY conf/shiro.ini /opt/zeppelin/conf/shiro.ini
COPY conf/certificate.pem /opt/zeppelin/spark/k8s_conf/certificate.pem
COPY conf/spark_token /opt/zeppelin/spark/k8s_conf/spark_token
# COPY notebook /opt/zeppelin/notebook