[![lint-build-test](https://github.com/Zenika/terraform-aws-cli/workflows/lint-build-test/badge.svg)](https://github.com/Zenika/terraform-aws-cli/actions?query=workflow%3Alint-build-test)
[![push-latest](https://github.com/Zenika/terraform-aws-cli/workflows/push-latest/badge.svg)](https://github.com/Zenika/terraform-aws-cli/actions?query=workflow%3Apush-latest)
[![release](https://github.com/Zenika/terraform-aws-cli/workflows/release/badge.svg)](https://github.com/Zenika/terraform-aws-cli/actions?query=workflow%3Arelease)

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Docker Pulls](https://img.shields.io/docker/pulls/zenika/terraform-aws-cli.svg)](https://hub.docker.com/r/zenika/terraform-aws-cli/)

# Terraform and AWS CLI Docker image

## 📦 Supported tags and respective Dockerfile links
Available image tags can be found on the Docker Hub registry: [zenika/terraform-aws-cli](https://hub.docker.com/r/zenika/terraform-aws-cli/tags)

The following image tag strategy is applied:
* `zenika/terraform-aws-cli:latest` - build from master
  * Included CLI versions can be found in the [Dockerfile](https://github.com/Zenika/terraform-aws-cli/blob/master/Dockerfile)
* `zenika/terraform-aws-cli:release-S.T_terraform-UU.VV.WW_awscli-XX.YY.ZZ` - build from releases
  * `release-S.T` is the release tag
  * `terraform-UU.VV.WWW` is the Terraform version included in the image
  * `awscli-XX.YY.ZZ` is the AWS CLI version included in the image

Please report to the [releases page](https://github.com/Zenika/terraform-aws-cli/releases) for the changelogs. Any other tags are not supported.

## 💡 Motivation
The goal is to create a **minimalist** and **lightweight** image with these tools in order to reduce network and storage impact.

This image gives you the flexibility to be used for development or as a base image as you see fits.

## 🔧 What's inside ?
Tools included:

* [AWS CLI](https://aws.amazon.com/fr/cli/)
  * Included version indicated in the image tag: `awscli-XX.YY.ZZ`
  * See available version on the [pip repository](https://pypi.org/project/awscli/#history)
* [Terraform CLI](https://www.terraform.io/docs/commands/index.html)
  * Included version indicated in the image tag: `terraform-XX.YY.ZZ`
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
You can build the image locally directly from the Dockerfiles, using the build script.

It will :
* Lint the Dockerfile with [Hadolint](https://github.com/hadolint/hadolint);
* Build and tag the image `zenika/terraform-aws-cli:dev`;
* Execute [container structure tests](https://github.com/GoogleContainerTools/container-structure-test) on the image.

```bash
# launch build script
./dev-build.sh
```

Optionally, it is possible to choose the tools desired versions using [Docker builds arguments](https://docs.docker.com/engine/reference/commandline/build/#set-build-time-variables---build-arg):

> Be aware that tests will fail and should be updated if you choose different CLI versions.

```bash
# Set tools desired versions
AWS_CLI_VERSION=1.18.93
TERRAFORM_VERSION=0.12.28

# launch the build script with parameters
./dev-build.sh $AWS_CLI_VERSION $TERRAFORM_VERSION
```

## 🙏 Contributions
Do not hesitate to contribute by [filling an issue](https://github.com/Zenika/terraform-aws-cli/issues) or [a PR](https://github.com/Zenika/terraform-aws-cli/pulls) !

## 📖 License
This project is under the [Apache License 2.0](https://raw.githubusercontent.com/Zenika/terraform-aws-cli/master/LICENSE)
