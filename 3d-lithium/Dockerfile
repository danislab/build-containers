FROM danislab/base:latest

ENV DEBIAN_FRONTEND="noninteractive"

RUN apt-get update \
    && apt-get install -y cmake-curses-gui \
    && apt-get install -y cxxtest \
    && apt-get install -y doxygen \
    && apt-get install -y doxygen-doc \
    && apt-get install -y doxygen-gui \
    && apt-get install -y graphviz \
    && apt-get install -y g++-mingw-w64 \
    && apt-get install -y libeigen3-dev \
    && apt-get install -y wget \
    && rm -rf /var/lib/apt/lists/*

RUN set -ex; \
    mkdir -p /usr/src/tmp; \
    cd /usr/src/tmp; \
    wget https://boostorg.jfrog.io/artifactory/main/release/1.75.0/source/boost_1_75_0.tar.bz2; \
    tar  -xvf boost_1_75_0.tar.bz2; \
    cd boost_1_75_0; \
    ./bootstrap.sh --prefix=/opt/boost; \
    ./b2 install;

ENV BOOST_ROOT=/opt/boost/include:$BOOST_ROOT