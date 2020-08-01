FROM alpine:latest
RUN apk --no-cache add lftp ca-certificates openssh
ADD --chown=0:0 download.sh /root/download.sh
ENTRYPOINT ["/root/download.sh"]