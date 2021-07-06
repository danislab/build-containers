FROM ubuntu:latest

ENV DEBIAN_FRONTEND="noninteractive"

RUN apt-get update && \
    apt-get -y install \
    apt-transport-https \
    autotools-dev \
    build-essential \
    ca-certificates \
    cmake-curses-gui \
    curl \
    cxxtest \
    doxygen \
    doxygen-doc \
    doxygen-gui \
    e2fslibs-dev \
    graphviz \
    git \
    g++ \
    g++-mingw-w64 \
    iputils-ping \
    libblkid-dev \
    libboost-all-dev \
    libbz2-dev \
    libeigen3-dev \
    libicu-dev \
    libssl-dev \
    net-tools \
    ntp \
    openssl \
    python-dev \
    python-setuptools \
    python3-pip \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN pip install numpy matplotlib future

RUN set -ex; \
    mkdir -p /usr/src/tmp; \
    cd /usr/src/tmp; \
    wget --secure-protocol=TLSv1 https://github.com/Kitware/CMake/releases/download/v3.20.2/cmake-3.20.2.tar.gz; \
    tar -zxvf cmake-3.20.2.tar.gz; \
    cd cmake-3.20.2; \
    ./bootstrap; \
    make; \
    make install;

RUN set -ex; \
    mkdir -p /usr/src/tmp; \
    cd /usr/src/tmp; \
    wget https://boostorg.jfrog.io/artifactory/main/release/1.75.0/source/boost_1_75_0.tar.bz2; \
    tar -xvf boost_1_75_0.tar.bz2; \
    cd boost_1_75_0; \
    echo "using gcc :  : x86_64-w64-mingw32-g++ ;" > user-config.jam; \
    ./bootstrap.sh; \
    ./b2 --user-config=./user-config.jam --prefix=./boost-x64 target-os=windows address-model=64 toolset=gcc variant=release install || :;

ENV BOOST_ROOT=/usr/src/tmp/boost_1_75_0/boost-x64/include$BOOST_ROOT
