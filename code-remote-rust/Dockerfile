FROM brycemclachlan/base-ubuntu:latest AS release
RUN  apt-get install -yq --no-install-recommends ca-certificates curl openssh-server build-essential checkinstall libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --profile complete
WORKDIR /
ADD Python-3.8.2.tgz .
WORKDIR /Python-3.8.2
RUN ./configure --enable-optimizations
RUN make altinstall  
RUN python3.8 -V
WORKDIR /
RUN rm -rf Python-3.8.2 python
RUN mkdir /run/sshd
RUN useradd -u 1500 -m -g users -G sudo brycemclachlan
WORKDIR /home/brycemclachlan
ADD id_rsa.pub /home/brycemclachlan/.ssh/id_rsa.pub
USER brycemclachlan
RUN chown -R brycemclachlan ~/.ssh
RUN chmod 700 -R ~/.ssh
USER root
EXPOSE 22/tcp
ENTRYPOINT  ["/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config"]