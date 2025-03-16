FROM kasproject/kas:latest

ARG USER_ID=1000
ARG USER_NAME
ARG GROUP_ID
ARG GROUP_NAME

RUN groupadd -f --gid ${GROUP_ID} ${GROUP_NAME} \
    && useradd --uid ${USER_ID} --gid ${GROUP_NAME} ${USER_NAME}

USER ${USER_NAME}

ENTRYPOINT ["/bin/bash"]