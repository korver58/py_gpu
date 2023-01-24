#!/bin/sh
docker build \
    -t py_gpu \
    -f Dockerfile . "$@"