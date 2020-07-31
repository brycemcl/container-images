FROM brycemclachlan/base-ubuntu:latest AS base
FROM base
RUN apt-get update && apt-get install -y --no-install-recommends lftp
ADD download.sh download.sh
ENTRYPOINT ["tini", "download.sh"]