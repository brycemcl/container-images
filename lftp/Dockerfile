FROM brycemclachlan/base-ubuntu:latest AS base
FROM base
RUN apt-get update && apt-get install -y --no-install-recommends lftp
##ADD smb.conf /etc/samba/smb.conf
ENTRYPOINT ["tini", "--"]
CMD ["lftp"]

## sudo podman run -p 137:137/udp -p 138:138/udp -p 139:139 -p 445:445