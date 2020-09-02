FROM brycemclachlan/base-ubuntu:latest AS base
FROM base
RUN apt-get update && apt-get install -y --no-install-recommends samba samba-common
#ENTRYPOINT ["tini", "--"]
CMD ["sh", "-c", "nmbd -D && /usr/sbin/smbd --foreground --no-process-group"]

## sudo podman run -p 137:137/udp -p 138:138/udp -p 139:139 -p 445:445
