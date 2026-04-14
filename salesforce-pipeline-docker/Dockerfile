FROM ubuntu:22.04

LABEL maintainer="Salesforce-Team-One"
LABEL description="Salesforce CI/CD pipeline agent"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl \
    git \
    openjdk-11-jre-headless \
    unzip \
    wget \
    jq \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    npm install --global @salesforce/cli@latest eslint && \
    echo y | sf plugins install sfdx-git-delta && \
    apt-get clean

WORKDIR /app