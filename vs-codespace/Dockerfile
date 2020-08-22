FROM brycemclachlan/base-ubuntu:latest AS base
FROM base
RUN apt-get update && apt-get install -y --no-install-recommends curl gnupg2 ca-certificates software-properties-common git entr
#codespace
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN add-apt-repository https://packages.microsoft.com/ubuntu/20.04/prod/
RUN apt-get update && apt-get install -y --no-install-recommends codespaces
#python
RUN apt-get update && apt-get install -y python-is-python3 python3-pip
##kube
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update 
RUN apt-get install -y  --no-install-recommends kubectl
#rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y -q --profile complete
#start
ENTRYPOINT ["tini", "--"]
CMD ["sh", "-c", "codespaces start"]