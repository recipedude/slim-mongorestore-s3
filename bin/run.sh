#!/bin/sh

docker run \
  --name mongorestore-s3 \
  --rm \
  --env-file config.env \
  --mount type=bind,source=/Users/sean/.aws,target=/root/.aws \
  recipedude/slim-mongorestore-s3:latest sleep 999999
