containerName="tomcat"
if [ ! "$(docker ps -q -f name=${containerName})" ]; then
    docker stop ${containerName}
    if [ "$(docker ps -aq -f status=exited -f name=${containerName})" ]; then
        # cleanup
        docker rm ${containerName}
    fi
    # run your container
    docker run -d --name ${containerName} -p 80:8080 -dt mikimanor/tomcat:alpine-modified
fi


