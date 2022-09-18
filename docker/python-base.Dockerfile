# syntax=docker/dockerfile:1
ARG debian_buster_image_tag=8-jre-slim
FROM openjdk:${debian_buster_image_tag}

# -- Layer: OS + Python 3.9

ARG python_version=3.9
ARG spark_version=3.2.1
ARG shared_workspace=/opt/src

RUN mkdir -p ${shared_workspace} && \
    apt-get update -y && \
    apt-get install -y python${python_version} && \
    ln -sf /usr/bin/python3 /usr/bin/python && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    python3-dev \
    openssh-client \
    gcc \
    git \
    make \
    # install curl needed for installing Poetry
    curl \
    python3-pip && \
    pip3 install --upgrade pip && \
    pip3 install \
    wget \
    cookiecutter \
    ipykernel \
    pyspark==${spark_version}

RUN curl -sSL https://install.python-poetry.org | python3 -

# Define the shared workspace path for all child images
# /opt/src
ENV SHARED_WORKSPACE=${shared_workspace}
ENV SHELL=/bin/bash

# -- Runtime

VOLUME ${shared_workspace}
CMD ["bash"]