#!/bin/bash -x

# build the builder container
docker build -t build-img -f Dockerfile.build . 


ID=$(docker create -it build-img bash)
docker cp src ${ID}:/app
docker start -i ${ID}

#docker cp ${ID}:/app/mgs.war ./target/mgs.war

# build container with app
#docker build -t img .

