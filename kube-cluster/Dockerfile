FROM ubuntu:rolling AS base
FROM base AS update
RUN apt-get update && apt-get dist-upgrade -y
FROM update AS release
RUN apt-get install -y --no-install-recommends apt-transport-https curl gnupg2
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update && apt-get install -y --no-install-recommends kubelet kubeadm kubectl containerd
RUN apt list --installed