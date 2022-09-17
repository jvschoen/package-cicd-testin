# syntax=docker/dockerfile:1
ARG debian_buster_image_tag=8-jre-slim
ARG python_version=3.8
FROM openjdk:${debian_buster_image_tag}

# -- Layer: OS + Python 3.8

ARG shared_workspace=/opt/workspace

RUN mkdir -p ${shared_workspace} && \
    apt-get update -y && \
    apt-get install -y python${python_version} && \
    ln -sf /usr/bin/python3 /usr/bin/python && \
    rm -rf /var/lib/apt/lists/*

ENV SHARED_WORKSPACE=${shared_workspace}

# -- Runtime

VOLUME ${shared_workspace}
CMD ["bash"]