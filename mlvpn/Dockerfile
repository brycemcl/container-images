FROM brycemclachlan/base-ubuntu:latest AS base
FROM base as build
RUN apt-get install -y flex bison build-essential wget
COPY ./tar .
ENV MLVPN_VERSION=2.3.5
ENV EV_VERSION=4.33
ENV LIBSODIUM_VERSION=1.0.18
ENV PCAP_VERSION=1.9.1

RUN mkdir /mlvpn
ENV INSTALLDIR=/mlvpn

RUN tar xzf libev-${EV_VERSION}.tar.gz && rm libev-${EV_VERSION}.tar.gz
RUN tar xzf libsodium-${LIBSODIUM_VERSION}.tar.gz && rm libsodium-${LIBSODIUM_VERSION}.tar.gz
RUN tar xzf libpcap-${PCAP_VERSION}.tar.gz && rm libpcap-${PCAP_VERSION}.tar.gz
RUN tar xzf mlvpn-${MLVPN_VERSION}.tar.gz && rm mlvpn-${MLVPN_VERSION}.tar.gz

RUN ls

WORKDIR /libev-${EV_VERSION}
RUN ./configure --enable-static --disable-shared  --prefix $INSTALLDIR/libev/
RUN make
RUN make -j4 install

WORKDIR /libsodium-${LIBSODIUM_VERSION}
RUN ./configure --enable-static --disable-shared  --prefix $INSTALLDIR/libsodium/
RUN make
RUN make -j4 install

WORKDIR /libpcap-${PCAP_VERSION}
RUN ./configure --enable-static --disable-shared  --prefix $INSTALLDIR/libpcap/
RUN make
RUN make -j4 install

WORKDIR /mlvpn-${MLVPN_VERSION}
RUN libpcap_LIBS="-L${INSTALLDIR}/libpcap/lib -lpcap" libpcap_CFLAGS="-I${INSTALLDIR}/libpcap/include" libsodium_LIBS="-L${INSTALLDIR}/libsodium/lib -lsodium" libsodium_CFLAGS=-I${INSTALLDIR}/libsodium/include libev_LIBS="-L${INSTALLDIR}/libev/lib -lev" libev_CFLAGS=-I${INSTALLDIR}/libev/include ./configure --enable-filters LDFLAGS="-Wl,-Bdynamic" --prefix=${INSTALLDIR}/mlvpn/ --enable-static --disable-shared 
RUN make
RUN make install

#FROM build as release
#COPY --from=build /mlvpn /mlvpn
#COPY --from=build /mlvpn-${MLVPN_VERSION} /
ENTRYPOINT ["tini", "--"]
CMD ["/mlvpn/mlvpn/sbin/mlvpn", "-c ", "--no-process-group"]
