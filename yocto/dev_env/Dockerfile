FROM ghcr.io/siemens/kas/kas:latest

ARG USER_ID=1000
ARG USER_NAME
ARG GROUP_ID
ARG GROUP_NAME

USER root

RUN apt update -y
RUN apt install -y make bash-completion \
    inkscape tmux bash curl texinfo
    
RUN apt install -y gawk make wget tar bzip2 \
    gzip python3 unzip perl patch diffutils \
    diffstat git cpp gcc chrpath \
    socat python3-pexpect findutils \
    file cpio python3-pip python3-jinja2 \
    zstd lz4 hostname xz-utils

# Clean the image to reduce its size.
RUN  apt-get clean && rm -rf /var/lib/apt/lists/*

RUN groupadd -f --gid ${GROUP_ID} ${GROUP_NAME}
RUN useradd --uid ${USER_ID} --gid ${GROUP_NAME} ${USER_NAME}

USER ${USER_NAME}

ENV SHELL=bash

ENTRYPOINT ["/bin/bash"]