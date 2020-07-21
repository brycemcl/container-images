FROM brycemclachlan/base-ubuntu:latest AS base

FROM base
RUN apt-get install --no-install-recommends -y git ca-certificates
RUN git clone https://github.com/dpwe/audfprint.git


FROM base 
COPY --from=jrottenberg/ffmpeg:snapshot-scratch / /
RUN apt-get install --no-install-recommends -y python3 python-is-python3 ca-certificates pip3
RUN mkdir /download
COPY --from=download /audfprint /audfprint
RUN pip3 install -r /audfprint/requirements.txt
COPY fingerprint.sh /fingerprint.sh

#CMD ["/download.sh"]
#ENV all_proxy=[http://][USER:PASSWORD@]HOST[:PORT]


ENTRYPOINT ["tini", "--", "/fingerprint.sh"]