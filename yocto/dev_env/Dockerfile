FROM oraclelinux:8


RUN dnf update -y
RUN dnf install -y gawk make wget tar bzip2 \
    gzip python3 unzip perl patch diffutils \
    diffstat git cpp gcc gcc-c++ glibc-devel \
    texinfo chrpath ccache perl-Data-Dumper \
    perl-Text-ParseWords perl-Thread-Queue \
    perl-bignum socat python3-pexpect findutils \
    which file cpio python python3-pip xz \
    python3-GitPython python3-jinja2 SDL-devel \
    rpcgen mesa-libGL-devel perl-FindBin \
    perl-File-Compare perl-File-Copy perl-locale \
    zstd lz4 hostname glibc-langpack-en libacl

RUN dnf install -y make python3-pip which bash-completion \
    inkscape texlive-fncychap tmux bash

RUN pip3 install sphinx sphinx_rtd_theme pyyaml


COPY env.txt /.env

RUN source /.env && groupadd --gid ${GROUP_ID} ${GROUP_NAME} \
    && useradd --uid ${USER_ID} --gid ${GROUP_NAME} ${USER_NAME}

CMD ["/bin/bash"]