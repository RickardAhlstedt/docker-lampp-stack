#!/bin/bash

cd "$(dirname "$0")/.."

docker-compose build
docker-compose stop $@
docker-compose up -d