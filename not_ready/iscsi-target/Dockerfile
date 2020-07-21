FROM brycemclachlan/base-ubuntu:latest AS base

FROM base AS build
RUN mkdir /lun
RUN truncate -s 10M /lun/1
ADD init.sh /init.sh
RUN chmod a+x /init.sh

FROM base
RUN apt-get install -y --no-install-recommends tgt
#RUN cat /usr/local/etc/istgt/auth.conf
RUN mkdir /lun
COPY --from=build /init.sh /init.sh
COPY --from=build /lun/1 /lun/1
#ADD targets.conf /etc/tgt/targets.conf
ENTRYPOINT ["tini", "--"]
CMD ["/init.sh"]
#CMD ["tgtd", "--iscsi", "portal=:3260,nop_interval=5,nop_count=6", "-D"]
#CMD ["tgtd", "-f /etc/ctl.conf"]

## sudo podman run -p 3260:3260 8a75f378dcf233bf80e4d3d1e4b042998f5e0e84270c7ad9c9b8e1dbd7fb78bd
#RUN tgtadm --lld iscsi --mode target --op new --tid=1 --targetname iqn.2020-06.xyz.bmclachlan.home:test
#RUN tgtadm --lld iscsi --mode logicalunit --op new --tid 1 --lun 1 -b /lun/1
#RUN tgtadm --lld iscsi --mode target --op bind --tid 1 -I ALL
#RUN cat /lib/systemd/system/tgt.service
#RUN cat /etc/tgt/targets.conf
#RUN ls /etc/tgt/conf.d/
#grep -iRls "iqn.2020-06.xyz.bmclachlan.home:test" /

