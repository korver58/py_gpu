FROM nvidia/cuda:11.6.1-cudnn8-devel-ubuntu20.04

ARG UID=1000
ARG USER=developer
RUN useradd -m -u ${UID} ${USER}
ENV DEBIAN_FRONTEND=noninteractive \
    HOME=/home/${USER}/
WORKDIR ${HOME}

RUN apt-get update && apt-get install -y \
    curl wget git build-essential \
    python3-dev python3-pip python3-wheel python3-setuptools \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --chown=${USER} requirements.txt ./requirements.txt
RUN pip3 install --upgrade pip \
    && pip3 install -r requirements.txt

USER ${USER}
CMD ["/bin/bash"]