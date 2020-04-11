FROM brycemclachlan/base-ubuntu:latest AS release
ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true
RUN     apt-get -yqq update && \
    apt-get install -yq --no-install-recommends ca-certificates curl openssh-server build-essential checkinstall libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev && \
    apt-get autoremove -y && \
    apt-get clean -y
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --profile complete
ADD https://www.python.org/ftp/python/3.8.2/Python-3.8.2.tgz python
RUN tar xzf python
RUN cd python
RUN ./configure --enable-optimizations
RUN make altinstall && python3.8 -V
RUN cd .. && rm -fR python
ENTRYPOINT  ["openssh-server"]