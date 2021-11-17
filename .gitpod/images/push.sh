#!/bin/bash
set -eu -o pipefail
# if [ -n "$DEBUG_DRUPALPOD" ]; then
#     set -x
# fi

# Run `docker login` to authenticate and push new images to docker hub
# Update /.gitpod.yml with the new image file

# "%Y-%m-%d"
TODAY=$(date +"%Y%m%d")
DOCKER_REPO=drupalpod/drupalpod-gitpod-base:"$TODAY"-base-experimental3

echo "Pushing ${DOCKER_REPO}"
set -x
# Build only current architecture and load into docker
# docker buildx build -t "${DOCKER_REPO}" --push --platform=linux/amd64 .
docker build -t "${DOCKER_REPO}" .
docker image push "${DOCKER_REPO}"
