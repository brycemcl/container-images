FROM brycemclachlan/base-ubuntu:latest AS release
RUN  apt-get install -yq --no-install-recommends ca-certificates curl openssh-server build-essential checkinstall libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --profile complete
WORKDIR /
ADD https://www.python.org/ftp/python/3.8.2/Python-3.8.2.tgz python
RUN tar xzf python
WORKDIR /Python-3.8.2
RUN ./configure --enable-optimizations
RUN make altinstall  
RUN python3.8 -V
WORKDIR /
RUN rm -rf Python-3.8.2
RUN mkdir /run/sshd
RUN useradd -u 1500 -m -g users -G sudo brycemclachlan
ENTRYPOINT  ["/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config"]