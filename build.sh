#!/bin/bash -x

docker build -t build-img -f Dockerfile.build . 


ID=$(docker create -it build-img)
docker cp src ${ID}:/app
docker start -i ${ID}
docker cp ${ID}:/app/target/app.war ./target/app.war
docker rm ${ID}

# build container with app
docker build -t img .

