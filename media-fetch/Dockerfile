FROM brycemclachlan/base-ubuntu:latest AS base

FROM base 
RUN apt-get install --no-install-recommends -y aria2 wget ffmpeg python3 python-is-python3 ca-certificates
RUN wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl && chmod a+rx /usr/local/bin/youtube-dl
RUN curl https://rclone.org/install.sh | bash
#COPY --from=jrottenberg/ffmpeg:snapshot-scratch / /
RUN mkdir /download
COPY aria2.conf /aria2/aria2.conf
COPY download.sh /download.sh
ENTRYPOINT ["tini", "--", "/download.sh"]
#CMD ["/download.sh"]
#ENV all_proxy=[http://][USER:PASSWORD@]HOST[:PORT]
