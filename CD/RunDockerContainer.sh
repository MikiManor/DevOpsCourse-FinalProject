#!/bin/bash -x

containerName=$1
containerTag=$2
pureName=cut -d "/" -f2 <<< ${containerName}

if [  "$(docker ps -q -f name=${containerName})" ]; then
    docker stop ${containerName}
    if [ "$(docker ps -aq -f status=exited -f name=${containerName})" ]; then
        # cleanup
        docker rm ${containerName}
    fi
fi
# run your container
docker run -d --name ${pureName} -p 80:8080 -dt ${containerTag}



