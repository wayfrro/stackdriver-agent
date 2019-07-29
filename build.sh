#!/bin/sh -ex

docker build -f Dockerfile -t wayfrro/stackdriver-agent:latest .
docker push wayfrro/stackdriver-agent:latest
