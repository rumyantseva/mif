#!/usr/bin/env bash

# Prepare & push images to dockerhub.
VERSION=0.0.2

# Prepare database with dump
echo "Prepare DB for version "$VERSION

cd ./db
unzip ./mifbooks.sql.zip
docker build --no-cache=true -t webdeva/mif-postgresql:$VERSION -f ./Dockerfile .
docker push webdeva/mif-postgresql:$VERSION

docker build --no-cache=true -t webdeva/mif-postgresql:latest -f ./Dockerfile .
docker push webdeva/mif-postgresql:latest

cd ..

# Prepare application
echo "Prepare app for version "$VERSION

env GOOS=linux GOARCH=amd64 go build .
docker build --no-cache=true -t webdeva/mif-app:$VERSION -f ./Dockerfile .
docker push webdeva/mif-app:$VERSION

docker build --no-cache=true -t webdeva/mif-app:latest -f ./Dockerfile .
docker push webdeva/mif-app:latest
