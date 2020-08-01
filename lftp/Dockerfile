FROM brycemclachlan/base-ubuntu:latest AS base
FROM base
RUN apt-get update && apt-get install -y --no-install-recommends lftp
ADD download.sh /root/download.sh
ENTRYPOINT ["tini", "/root/download.sh", "--"]


#./download.sh sftp://apollo.feralhosting.com ./private/downloaded/tv/The.Umbrella.Academy.S02.1080p.NF.WEBRip.DDP5.1.x264-MIXED[rartv] /run/media/brycemclachlan/USB/The.Umbrella.Academy.S02.1080p.NF.WEBRip.DDP5.1.x264-MIXED[rartv]