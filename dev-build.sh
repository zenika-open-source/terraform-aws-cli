#!/usr/bin/env bash

set -eo pipefail

if [ -n "$1" ] && [ -n "$2" ] ; then
  echo "Building images with parameters AWS_CLI_VERSION=${1} and TERRAFORM_VERSION=${2}"
  docker image build --build-arg AWS_CLI_VERSION="$1" --build-arg TERRAFORM_VERSION="$2" -t zenika/terraform-aws-cli:latest .
else
  echo "Please provide AWS_CLI_VERSION and TERRAFORM_VERSION parameters"
  echo "Usage: ./dev-build.sh ${AWS_CLI_VERSION} ${TERRAFORM_VERSION}"
fi
