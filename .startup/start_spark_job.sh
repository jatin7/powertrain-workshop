IP="ip route get 1 | awk '{print $NF;exit}'"
echo "Submitting Spark Streaming Job"
sed -i '/spark.dse_host/c\spark.dse_host $IP' PowertrainStreaming/conf/application.conf
sbt package
nohup dse spark-submit --packages org.apache.spark:spark-streaming-kafka_2.10:1.6.1  --conf=spark.executor.memory=8g --class powertrain.StreamVehicleData  --properties-file=PowertrainStreaming/conf/application.conf streaming-vehicle-app_2.10-1.0-SNAPSHOT.jar 2>&1 1> streaming.log &