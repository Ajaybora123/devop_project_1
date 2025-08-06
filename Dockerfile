FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TERRAFORM_VERSION=1.8.5

RUN apt-get update && \
    apt-get install -y \
    curl unzip git openjdk-17-jre-headless wget gnupg \
    software-properties-common ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform.zip && \
    unzip terraform.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform.zip

RUN useradd -m -s /bin/bash jenkins

WORKDIR /home/jenkins

USER jenkins

CMD ["bash"]
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TERRAFORM_VERSION=1.8.5

RUN apt-get update && \
    apt-get install -y \
    curl unzip git openjdk-17-jre-headless wget gnupg \
    software-properties-common ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform.zip && \
    unzip terraform.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform.zip

RUN useradd -m -s /bin/bash jenkins

WORKDIR /home/jenkins

USER jenkins

CMD ["bash"]
