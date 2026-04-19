FROM ubuntu:22.04

LABEL maintainer="Salesforce-Team-One"
LABEL description="Salesforce CI/CD pipeline agent"

ENV DEBIAN_FRONTEND=noninteractive
ENV PMD_VERSION=6.55.0

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

RUN wget -q \
  https://github.com/pmd/pmd/releases/download/pmd_releases/${PMD_VERSION}/pmd-bin-${PMD_VERSION}.zip \
  -O /tmp/pmd.zip && \
  unzip -q /tmp/pmd.zip -d /opt && \
  mv /opt/pmd-bin-${PMD_VERSION} /opt/pmd && \
  rm /tmp/pmd.zip

RUN mkdir -p /app && cd /app && \
    npm init -y && \
    npm install --save-dev \
        eslint \
        @salesforce/eslint-config-lwc \
        @salesforce/eslint-plugin-aura \
        @salesforce/eslint-plugin-lightning \
        @lwc/eslint-plugin-lwc

WORKDIR /app