#!/bin/bash

# Variables
Username="tylerstaut"
Reponame="source-servers"
Base=1

# Login to Docker
docker login

# Update Base Image if needed
if [ $Base == 1 ]
then
  docker build --tag "$Username"/"$Reponame":latest . --no-cache
  docker push "$Username"/"$Reponame":latest
fi


# Update all Game Server Images
for d in */ ; do
    docker build --tag "$Username"/"$Reponame":`echo ${d%?}` ./"$d". --no-cache
    docker push "$Username"/"$Reponame":`echo ${d%?}`
done
