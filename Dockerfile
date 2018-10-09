FROM ubuntu:18.04

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
        make python g++ curl \
        gnupg ffmpeg libspeexdsp-dev libebur128-dev libsoundio-dev libchromaprint-dev \
        libgrooveloudness-dev libgroovefingerprinter-dev libgrooveplayer-dev libgroove-dev \
    && curl -sL https://deb.nodesource.com/setup_9.x -o nodesource_setup.sh \
    && bash nodesource_setup.sh \
    && apt-get install -y nodejs \
    && npm install -g node-gyp
