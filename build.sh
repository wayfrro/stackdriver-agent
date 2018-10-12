#!/bin/sh -ex

docker build -f Dockerfile -t poeyashi/stackdriver-agent:latest .
docker push poeyashi/stackdriver-agent:latest
