cd dockers/spark/jars
echo ${PWD}
wget --no-verbose https://repo1.maven.org/maven2/org/apache/spark/spark-streaming_2.13/3.2.1/spark-streaming_2.13-3.2.1.jar
wget --no-verbose https://repo1.maven.org/maven2/org/apache/spark/spark-streaming-kafka-0-10-assembly_2.13/3.2.1/spark-streaming-kafka-0-10-assembly_2.13-3.2.1.jar
wget --no-verbose https://repo1.maven.org/maven2/org/apache/kafka/kafka-clients/3.1.0/kafka-clients-3.1.0.jar
wget --no-verbose https://repo1.maven.org/maven2/org/apache/commons/commons-pool2/2.11.1/commons-pool2-2.11.1.jar
wget --no-verbose https://repo1.maven.org/maven2/org/apache/spark/spark-sql-kafka-0-10_2.13/3.2.1/spark-sql-kafka-0-10_2.13-3.2.1.jar
wget --no-verbose https://repo1.maven.org/maven2/org/apache/spark/spark-token-provider-kafka-0-10_2.12/3.2.1/spark-token-provider-kafka-0-10_2.12-3.2.1.jar
wget --no-verbose https://repo1.maven.org/maven2/org/postgresql/postgresql/42.2.5/postgresql-42.2.5.jar
wget --no-verbose https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk/1.12.205/aws-java-sdk-1.12.205.jar
wget --no-verbose https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.12.205/aws-java-sdk-bundle-1.12.205.jar
wget --no-verbose https://repo1.maven.org/maven2/io/delta/delta-core_2.13/1.2.0/delta-core_2.13-1.2.0.jar
wget --no-verbose https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.2/hadoop-aws-3.3.2.jar
cd ../../..