#!/bin/bash -x

containerName=$1
containerTag=$2
pureName=`cut -d "/" -f2 <<< ${containerName}`

if [  "$(docker ps -q -f name=${pureName})" ]; then
    docker stop ${pureName}
    if [ "$(docker ps -aq -f status=exited -f name=${pureName})" ]; then
        # cleanup
        docker rm ${pureName}
    fi
fi
# run your container
docker run -d --name ${pureName} -p 80:8080 -dt ${containerName}:${containerTag}



