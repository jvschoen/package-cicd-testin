FROM python-base

# -- Layer: Jupyterlab

ARG jupyterlab_version=3.3.0

RUN pip3 install \
    jupyterlab==${jupyterlab_version} \
    jupyterlab-git \
    jupyterlab-spellchecker \
    jupytext \
    jupyterlab-lsp

ENV PATH="$HOME/.local/bin:${PATH}"

# -- Runtime

EXPOSE 8888

# /opt/src
WORKDIR $SHARED_WORKSPACE
CMD jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=
