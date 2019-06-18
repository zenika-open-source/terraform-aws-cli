[![Docker Build Status](https://img.shields.io/docker/cloud/build/zenika/terraform-aws-cli.svg)](https://hub.docker.com/r/zenika/terraform-aws-cli/)
[![](https://images.microbadger.com/badges/image/zenika/terraform-aws-cli.svg)](https://microbadger.com/images/zenika/terraform-aws-cli)
[![Docker Pulls](https://img.shields.io/docker/pulls/zenika/terraform-aws-cli.svg)](https://hub.docker.com/r/zenika/terraform-aws-cli/)

# Terraform and AWS CLI Docker image

## Supported tags and respective Dockerfile links
Repository available on Docker Hub: [zenika/terraform-aws-cli](https://hub.docker.com/r/zenika/terraform-aws-cli)

* [zenika/terraform-aws-cli:latest](https://github.com/Zenika/terraform-aws-cli/blob/master/alpine.Dockerfile)
* [zenika/terraform-aws-cli:latest-debian](https://github.com/Zenika/terraform-aws-cli/blob/master/debian.Dockerfile)
* [zenika/terraform-aws-cli:2.0-alpine](https://github.com/Zenika/terraform-aws-cli/blob/2.0/alpine.Dockerfile)
* [zenika/terraform-aws-cli:2.0-debian](https://github.com/Zenika/terraform-aws-cli/blob/2.0/debian.Dockerfile)
* [zenika/terraform-aws-cli:1.0-alpine](https://github.com/Zenika/terraform-aws-cli/blob/1.0/alpine.Dockerfile)
* [zenika/terraform-aws-cli:1.0-debian](https://github.com/Zenika/terraform-aws-cli/blob/1.0/debian.Dockerfile)

## Motivation

The goal is to create a **minimalist** and **lightweight** image with these tools in order to reduce network and storage impact.

This image gives you the flexibility to be used for development or as a base image as you see fits.

## What's inside ?
Tools included:

* [AWS CLI](https://aws.amazon.com/fr/cli/), see available version on the [pip repository](https://pypi.org/project/awscli/#history)
* [Terraform CLI](https://www.terraform.io/docs/commands/index.html), see available versions on the [project release page](https://github.com/hashicorp/terraform/releases)

## Usage

### Launch the CLI
Simply launch the container and use the CLI as you would on any other platform, for instance using the latest *alpine* based image:

```bash
docker container run -it --rm -v ${PWD}:/workspace zenika/terraform-aws-cli:latest
```

> The `--rm` flag will completely destroy the container and its data on exit.

### Build the image
You can build the image locally directly from the Dockerfiles.

```bash
# Build the Debian based image:
docker image build -f debian.Dockerfile -t zenika/terraform-aws-cli:debian .

# Build the Alpine based image:
docker image build -f alpine.Dockerfile -t zenika/terraform-aws-cli:alpine .
```

Optionally, it is possible to choose the tools desired versions using [Docker builds arguments](https://docs.docker.com/engine/reference/commandline/build/#set-build-time-variables---build-arg) :

```bash
# Set tools desired versions
AWS_CLI_VERSION=1.16.166
TERRAFORM_VERSION=0.12.0

# Build the Debian based image:
docker image build --build-arg AWS_CLI_VERSION=$AWS_CLI_VERSION --build-arg TERRAFORM_VERSION=$TERRAFORM_VERSION -f debian.Dockerfile -t zenika/terraform-aws-cli:debian .

# Build the Alpine based image:
docker image build --build-arg AWS_CLI_VERSION=$AWS_CLI_VERSION --build-arg TERRAFORM_VERSION=$TERRAFORM_VERSION -f alpine.Dockerfile -t zenika/terraform-aws-cli:alpine .
```

## Contributions
Do not hesitate to contribute by [filling an issue](https://github.com/Zenika/terraform-aws-cli/issues) or [a PR](https://github.com/Zenika/terraform-aws-cli/pulls) !
