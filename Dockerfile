FROM wpilib/roborio-cross-ubuntu:2024-22.04
# RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1A127079A92F09ED
RUN apt-get --allow-unauthenticated update --no-install-recommends && \
    apt-get install -y build-essential clang git \
    gcc-multilib g++-multilib libssh-dev libopencv-dev \
    protobuf-compiler libprotobuf-dev libprotoc-dev \
    python3 python3-pip cmake && \
    apt-get clean && apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*
RUN pip3 install meson

RUN mkdir -p /src
ADD ./luajit /src/luajit
ADD ./allwpilib /src/allwpilib
ADD ./*.sh /src/
RUN cd /src && bash build-luajit-linux64.sh && \
    bash build-luajit-roborio.sh && \
    bash build-wpilib-linux64.sh && \
    cd / && rm -rf src

VOLUME $HOME/SDKs
