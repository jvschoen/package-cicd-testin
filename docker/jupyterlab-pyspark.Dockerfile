FROM base-image

# -- Layer: Jupyterlab

ARG spark_version=3.2.1
ARG jupyterlab_version=3.3.0

RUN apt-get update -y && \
    apt-get install -y python3-pip && \
    pip3 install --upgrade pip && \
    pip3 install wget pyspark==${spark_version} jupyterlab==${jupyterlab_version}

# -- Runtime

EXPOSE 8888
WORKDIR $SHARED_WORKSPACE
CMD jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=