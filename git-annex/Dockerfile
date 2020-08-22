FROM brycemclachlan/base-ubuntu:latest AS base
FROM base AS build
RUN apt-get update && apt-get install -y --no-install-recommends git ca-certificates
##build git-annex
RUN git clone git://git-annex.branchable.com/ git-annex
RUN cd git-annex
RUN grep -v '#' /etc/apt/sources.list | grep -v '^$' > /etc/apt/sources-temp.list
RUN cp /etc/apt/sources-temp.list /etc/apt/sources.list
RUN sed 's/deb/deb-src/' /etc/apt/sources-temp.list >> /etc/apt/sources.list
RUN rm /etc/apt/sources-temp.list

RUN apt-get update && apt-get build-dep git-annex -y
WORKDIR git-annex
RUN make
RUN make install PREFIX=/usr/local


FROM base
COPY --from=build /usr/local /usr/local
ENTRYPOINT ["tini", "-g", "--"]
CMD ["sh", "-c", "git-annex assistant --foreground"]
WORKDIR /srv/Server



RUN export AWS_ACCESS_KEY_ID="001624fb226b0570000000009"
RUN export AWS_SECRET_ACCESS_KEY="K001h+VHBbd3qoa9c4focudOTKaoVus"

RUN export endpoint=s3.us-west-001.backblazeb2.com
RUN export bucketid=bryce-sync
RUN git init
RUN git config --global user.email "brycemclachlan@gmail.com"
RUN git config --global user.name "Bryce McLachlan"
RUN git annex init
RUN git config annex.largefiles anything
RUN git remote add --mirror=push origin https://github.com/brycemcl/bryce-sync.git 
RUN git annex initremote backblaze type=S3 signature='v4' host=$endpoint bucket=$bucketid protocol=https encryption=none