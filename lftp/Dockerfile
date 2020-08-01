FROM alpine:latest
RUN apk --no-cache add lftp ca-certificates openssh bash
ADD download.sh /root/download.sh
ENTRYPOINT ['/bin/bash', '-c' '/root/download.sh']