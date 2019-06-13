# Setup build arguments with default versions
ARG AWS_CLI_VERSION=1.16.177
ARG TERRAFORM_VERSION=0.12.2

# Download Terraform binary
FROM debian:stretch-20190506-slim as terraform
ARG TERRAFORM_VERSION
RUN apt-get update
RUN apt-get install -y curl=7.52.1-5+deb9u9
RUN apt-get install -y unzip=6.0-21+deb9u1
RUN apt-get install -y gnupg=2.1.18-8~deb9u4
RUN curl -Os https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_SHA256SUMS
RUN curl -Os https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
RUN curl -Os https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_SHA256SUMS.sig
COPY hashicorp.asc hashicorp.asc
RUN gpg --import hashicorp.asc
RUN gpg --verify terraform_${TERRAFORM_VERSION}_SHA256SUMS.sig terraform_${TERRAFORM_VERSION}_SHA256SUMS
RUN grep terraform_${TERRAFORM_VERSION}_linux_amd64.zip terraform_${TERRAFORM_VERSION}_SHA256SUMS | sha256sum -c -
RUN unzip -j terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Install AWS CLI using PIP
FROM debian:stretch-20190506-slim as aws-cli
ARG AWS_CLI_VERSION
RUN apt-get update
RUN apt-get install -y python3=3.5.3-1
RUN apt-get install -y python3-pip=9.0.1-2+deb9u1
RUN pip3 install awscli==${AWS_CLI_VERSION}

# Build final image
FROM debian:stretch-20190506-slim
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    ca-certificates=20161130+nmu1+deb9u1 \
    jq=1.5+dfsg-1.3 \
    python3=3.5.3-1 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && ln -s /usr/bin/python3 /usr/bin/python
COPY --from=terraform /terraform /usr/local/bin/terraform
COPY --from=aws-cli /usr/local/bin/aws* /usr/local/bin/
COPY --from=aws-cli /usr/local/lib/python3.5/dist-packages /usr/local/lib/python3.5/dist-packages
COPY --from=aws-cli /usr/lib/python3/dist-packages /usr/lib/python3/dist-packages
WORKDIR /workspace
CMD ["bash"]
