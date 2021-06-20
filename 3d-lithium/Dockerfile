FROM ubuntu:latest

ENV DEBIAN_FRONTEND="noninteractive"

RUN apt-get update \
    && apt-get install -y g++-mingw-w64 \
    && apt-get install -y libeigen3-dev \
    && rm -rf /var/lib/apt/lists/*
