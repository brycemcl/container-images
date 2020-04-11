FROM ubuntu:latest AS release
RUN     apt-get -yqq update && \
        apt-get install -yq --no-install-recommends curl openssh-server && \
        apt-get autoremove -y && \
        apt-get clean -y
RUN curl https://sh.rustup.rs -sSf | sh -s -- -qy --profile complete
ENTRYPOINT  ["openssh-server"]