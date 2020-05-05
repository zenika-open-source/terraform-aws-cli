[![build](https://github.com/Zenika/terraform-aws-cli/workflows/build/badge.svg)](https://github.com/Zenika/terraform-aws-cli/actions?query=workflow%3Abuild)
[![push-latest](https://github.com/Zenika/terraform-aws-cli/workflows/push-latest/badge.svg)](https://github.com/Zenika/terraform-aws-cli/actions?query=workflow%3Apush-latest)
[![release](https://github.com/Zenika/terraform-aws-cli/workflows/release/badge.svg)](https://github.com/Zenika/terraform-aws-cli/actions?query=workflow%3Arelease)
[![](https://images.microbadger.com/badges/image/zenika/terraform-aws-cli.svg)](https://microbadger.com/images/zenika/terraform-aws-cli)
[![Docker Pulls](https://img.shields.io/docker/pulls/zenika/terraform-aws-cli.svg)](https://hub.docker.com/r/zenika/terraform-aws-cli/)

# Terraform and AWS CLI Docker image

## 📦 Supported tags and respective Dockerfile links
Available image tags can be found on the Docker Hub registry: [zenika/terraform-aws-cli](https://hub.docker.com/r/zenika/terraform-aws-cli/tags)

The following image tag strategy is applied:
* `zenika/terraform-aws-cli:latest` - build from master
  * Included CLI versions can be found in the [Dockerfile](https://github.com/Zenika/terraform-aws-cli/blob/master/Dockerfile)
* `zenika/terraform-aws-cli:S.T-tfUU.VV.WW-awscliXX.YY.ZZ` - build from releases
  * `S.T` is the release tag
  * `UU.VV.WWW` is the Terraform version included in the image
  * `XX.YY.ZZ` is the AWS CLI version included in the image

Please report to the [releases page](https://github.com/Zenika/terraform-aws-cli/releases) for the changelogs. Any other tags are not supported.

## 💡 Motivation

The goal is to create a **minimalist** and **lightweight** image with these tools in order to reduce network and storage impact.

This image gives you the flexibility to be used for development or as a base image as you see fits.

## 🔧 What's inside ?
Tools included:

* [AWS CLI](https://aws.amazon.com/fr/cli/)
  * Included version indicated in the image tag: `tfXX.YY.ZZ`
  * See available version on the [pip repository](https://pypi.org/project/awscli/#history)
* [Terraform CLI](https://www.terraform.io/docs/commands/index.html)
  * Included version indicated in the image tag: `awscliXX.YY.ZZ`
  * See available versions on the [project release page](https://github.com/hashicorp/terraform/releases)
* [Git](https://git-scm.com/) for Terraform remote module usage, see available versions on the [Debian Packages repository](https://packages.debian.org/search?suite=buster&arch=any&searchon=names&keywords=git)
* [jq](https://stedolan.github.io/jq/) to process JSON returned by AWS, see available versions on the [Debian Packages repository](https://packages.debian.org/search?suite=buster&arch=any&searchon=names&keywords=jq)

## 🚀 Usage

### Launch the CLI
Set your AWS credentials (optional) and launch the container, for instance using the latest image:

```bash
echo AWS_ACCESS_KEY_ID=YOUR_ACCESS_KEY
echo AWS_SECRET_ACCESS_KEY=YOUR_SECRET_KEY
echo AWS_DEFAULT_REGION=YOUR_DEFAULT_REGION

docker container run -it --rm -e "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" -e "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" -e "AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}" -v ${PWD}:/workspace zenika/terraform-aws-cli:latest
```

> The `--rm` flag will completely destroy the container and its data on exit.

### Build the image
You can build the image locally directly from the Dockerfiles, using the build script::

```bash
# Set tools desired versions
AWS_CLI_VERSION=1.18.52
TERRAFORM_VERSION=0.12.24

# launch the build script with parameters
./dev-build.sh $AWS_CLI_VERSION $TERRAFORM_VERSION
```

## 🙏 Contributions
Do not hesitate to contribute by [filling an issue](https://github.com/Zenika/terraform-aws-cli/issues) or [a PR](https://github.com/Zenika/terraform-aws-cli/pulls) !

## 📖 License
This project is under the [Apache License 2.0](https://raw.githubusercontent.com/Zenika/terraform-aws-cli/master/LICENSE)
