#!/bin/sh

DOCKER_USER="kcbabo"

docker build rest-api -t tracks-rest-api
docker tag tracks-rest-api $DOCKER_USER/tracks-rest-api
docker push $DOCKER_USER/tracks-rest-api

docker build graphql-api -t tracks-graphql-api
docker tag tracks-graphql-api $DOCKER_USER/tracks-graphql-api
docker push $DOCKER_USER/tracks-graphql-api