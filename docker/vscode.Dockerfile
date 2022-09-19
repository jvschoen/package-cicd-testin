FROM python-base

RUN mkdir /opt/local
# /opt/src
#WORKDIR $SHARED_WORKSPACE

RUN useradd -ms /bin/bash vscode

USER vscode
WORKDIR ${HOME}/vscode
RUN ln -s /opt/src ~/src
RUN ln -s /opt/local ~/local

ENV PATH="$HOME/root/.local/bin:${PATH}"