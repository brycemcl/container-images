FROM brycemclachlan/base-ubuntu:latest AS base
FROM base
RUN apt-get install -y --no-install-recommends ca-certificates apt-transport-https curl gnupg2 && \
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list && \
apt-get update 
## && \
RUN apt-get install -y  --no-install-recommends kubelet=1.16* kubeadm=1.17* kubectl=1.17* containerd && \
apt-get purge -y apt-transport-https curl gnupg2 && \
apt-get autoremove -y && \
apt list kubelet kubeadm kubectl containerd