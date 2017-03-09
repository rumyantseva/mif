#!/usr/bin/env bash

# Prepare & push images to dockerhub.

# Prepare database with dump
docker build --no-cache=true -t webdeva/mif-postgresql:latest -f ./db/Dockerfile .
docker push webdeva/mif-postgresql

# Prepare application
env GOOS=linux GOARCH=amd64 go build .
docker build --no-cache=true -t webdeva/mif-app:latest -f ./Dockerfile .
docker push webdeva/mif-app
