#!/usr/bin/env bash

set -eo pipefail

IMAGE_NAME="zenika/terraform-aws-cli:dev"

# Lint Dockerfile
echo "Linting Dockerfile..."
docker run --rm -i hadolint/hadolint:v1.17.6-alpine < Dockerfile
echo "Lint Successful!"

# Build dev image
if [ -n "$1" ] && [ -n "$2" ] ; then
  echo "Building images with parameters AWS_CLI_VERSION=${1} and TERRAFORM_VERSION=${2}..."
  docker image build --build-arg AWS_CLI_VERSION="$1" --build-arg TERRAFORM_VERSION="$2" -t $IMAGE_NAME .
else
  echo "Building images with default parameters..."
  docker image build -f Dockerfile -t $IMAGE_NAME .
fi

# Test dev image
echo "Executing container structure test..."
docker container run --rm -it -v "${PWD}"/tests/container-structure-tests.yml:/tests.yml:ro -v /var/run/docker.sock:/var/run/docker.sock:ro gcr.io/gcp-runtimes/container-structure-test:v1.8.0 test --image $IMAGE_NAME --config /tests.yml
