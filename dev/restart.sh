#!/bin/bash

cd "$(dirname "$0")/.."

docker-compose stop $@
docker-compose up -d