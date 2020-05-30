FROM ubuntu:rolling AS base
FROM base AS update
RUN apt-get update && apt-get upgrade -y
FROM update AS release
RUN apt-get install -y --no-install-recommends ca-certificates apt-transport-https curl gnupg2 && \
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list && \
apt-get update && \
apt-get install -y --no-install-recommends kubelet kubeadm kubectl containerd && \
apt-get purge -y apt-transport-https curl gnupg2 && \
apt list kubelet kubeadm kubectl containerd 