FROM brycemclachlan/base-ubuntu:latest AS base

FROM base AS build-gpac
RUN apt-get update
RUN apt-get install -y fakeroot             
RUN apt-get install -y dpkg-dev
RUN apt-get install -y devscripts
RUN apt-get install -y debhelper
RUN apt-get install -y ccache
RUN apt-get install -y build-essential
RUN apt-get install -y pkg-config
RUN apt-get install -y g++
RUN apt-get install -y git
RUN apt-get install -y scons
RUN apt-get install -y cmake
RUN apt-get install -y yasm
RUN apt-get install -y zlib1g-dev 
RUN apt-get install -y libfreetype6-dev
RUN apt-get install -y libjpeg62-dev 
RUN apt-get install -y libpng-dev
RUN apt-get install -y libmad0-dev 
RUN apt-get install -y libfaad-dev 
RUN apt-get install -y libogg-dev 
RUN apt-get install -y libvorbis-dev 
RUN apt-get install -y libtheora-dev 
RUN apt-get install -y liba52-0.7.4-dev 
RUN apt-get install -y libavcodec-dev 
RUN apt-get install -y libavformat-dev 
RUN apt-get install -y libavutil-dev 
RUN apt-get install -y libswscale-dev 
RUN apt-get install -y libavdevice-dev 
RUN apt-get install -y libxv-dev 
RUN apt-get install -y x11proto-video-dev 
RUN apt-get install -y libgl1-mesa-dev 
RUN apt-get install -y x11proto-gl-dev 
RUN apt-get install -y libxvidcore-dev 
RUN apt-get install -y libssl-dev 
RUN apt-get install -y libjack-dev 
RUN apt-get install -y libasound2-dev 
RUN apt-get install -y libpulse-dev 
RUN apt-get install -y libsdl2-dev

RUN apt-get install -y apt-utils
RUN apt-get install -y udev
RUN apt-get install -y makedev

RUN apt-get install -y dvb-apps 
RUN apt-get install -y mesa-utils

RUN git clone https://github.com/gpac/gpac gpac_public
RUN git clone https://github.com/gpac/deps_unix
RUN cd deps_unix
RUN git submodule update --init --recursive --force --checkout
RUN ./build_all.sh linux
RUN ./configure
RUN make
RUN sudo make install
RUN make deb
RUN ls



#FROM base AS build-ffmpeg
#RUN apt-get update && apt-get install -y 

#ENTRYPOINT ["tini", "--"]
#CMD ["/usr/sbin/smbd", "--foreground", "--no-process-group"]
