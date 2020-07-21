FROM brycemclachlan/base-ubuntu:latest AS build
RUN  apt-get update && apt-get install -yq --no-install-recommends ca-certificates git entr curl sudo openssh-server build-essential checkinstall libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev
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
EXPOSE 22/tcp
ENTRYPOINT  ["/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config"]
RUN apt-get install -y --no-install-recommends ca-certificates apt-transport-https curl gnupg2
##podman
RUN sh -c "echo 'deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/ /' > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list"
RUN curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/Release.key | apt-key add -
RUN apt-get update -qq
RUN apt-get -qq -y install podman
##kube
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update 
RUN apt-get install -y  --no-install-recommends kubectl