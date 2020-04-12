FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true
RUN     apt-get -yqq update && \
    apt-get -yqq dist-upgrade && \
    apt-get autoremove -y && \
    apt-get clean -y