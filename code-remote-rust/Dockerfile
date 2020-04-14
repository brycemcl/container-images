FROM brycemclachlan/base-ubuntu:latest AS build
RUN  apt-get install -yq --no-install-recommends ca-certificates curl sudo openssh-server build-essential checkinstall libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y -q --profile complete
WORKDIR /
ADD Python-3.8.2.tgz .
WORKDIR /Python-3.8.2
RUN ./configure --enable-optimizations
RUN make altinstall  
RUN python3.8 -V
WORKDIR /
RUN rm -rf Python-3.8.2
RUN mkdir /run/sshd
RUN useradd -u 1500 -m -g users -G sudo brycemclachlan
WORKDIR /home/brycemclachlan
ADD id_rsa.pub /home/brycemclachlan/.ssh/authorized_keys
ADD sshd_config /etc/ssh/sshd_config
RUN chown -R root /etc/ssh/sshd_config
RUN chown -R brycemclachlan ./.ssh
RUN chmod 700 -R ./.ssh
RUN usermod --shell /bin/bash brycemclachlan
RUN  echo '%sudo ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
#WORKDIR /
#RUN touch ./scratch.tar.gz
#RUN  tar --exclude=./scratch.tar.gz --exclude=./sys/ --one-file-system -cvzpf ./scratch.tar.gz ./ ; exit 0
#FROM scratch AS release
#COPY --from=build /scratch.tar.gz /
EXPOSE 22/tcp
ENTRYPOINT  ["/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config"]

##podman run -p 44747:22 --name ssh brycemclachlan/code-remote-rust
##podman kill ssh && podman rm ssh