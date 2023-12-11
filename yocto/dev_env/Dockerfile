FROM oraclelinux:8


# NEED TO FIND
#  ccache  
# perl-FindBin perl-File-Compare perl-File-Copy perl-locale
#

RUN dnf config-manager --add-repo https://yum.oracle.com/repo/OracleLinux/OL8/codeready/builder/developer/x86_64/
RUN dnf update -y
RUN dnf install -y gawk make wget tar bzip2 \
    gzip python3 unzip perl patch diffutils \
    diffstat git cpp gcc gcc-c++ glibc-devel \
    chrpath perl-Data-Dumper \
    perl-Text-ParseWords perl-Thread-Queue \
    perl-bignum socat python3-pexpect findutils \
    which file cpio python3-pip xz python3-jinja2 \
    SDL-devel mesa-libGL-devel zstd lz4 hostname \
    glibc-langpack-en libacl

RUN dnf install -y make which bash-completion \
    inkscape texlive-fncychap tmux bash curl \
    rpcgen texinfo

COPY env.txt /.env
RUN cat /.env
RUN source /.env && groupadd -f --gid ${GROUP_ID} ${GROUP_NAME} \
    && useradd --uid ${USER_ID} --gid ${GROUP_NAME} ${USER_NAME}

USER ${USER_NAME}
RUN pip3 install --user sphinx sphinx_rtd_theme pyyaml \
        distro jsonschema kconfiglib GitPython 

ENTRYPOINT ["/bin/bash"]