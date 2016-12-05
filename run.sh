#!/bin/bash -x

# build the builder container
docker build -t build-img -f Dockerfile.build . 


ID=$(docker create build-img)
docker cp ${ID}:/app/mgs.war ./target/mgs.war


# build container with app
#docker build -t img .

