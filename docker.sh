cp ~/.ssh/id_rsa .
docker build -t powertrain .
docker run \
  --net=host -td  \
  -p 0.0.0.0:9000:9000 \
  -p 0.0.0.0:9092:9092 \
  powertrain /bin/bash ./docker.sh
