FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

WORKDIR /home/default

RUN apt-get update &&\
    apt-get install -y \
        python3 \
        python3-pip \
        git \
        cmake \
        lsof \
        sudo \
        less \
        nano \
        vim \
        wget &&\
    apt-get clean &&\
    rm -rf /var/cache

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

WORKDIR /home/default/

RUN git clone https://github.com/iaiamomo/TSC-planning-experiments.git &&\
    cd /home/default/TSC-planning-experiments &&\
    git clone https://github.com/iaiamomo/IndustrialAPI.git &&\
    git clone https://github.com/aibasel/downward.git

RUN cd /home/default/TSC-planning-experiments/downward &&\
    ./build.py &&\
    cd /home/default/TSC-planning-experiments/IndustrialAPI/actors_api_plan/openapi_client_script &&\
    chmod +x generate-openapi-client.sh &&\
    ./generate-openapi-client.sh

WORKDIR /home/default/TSC-planning-experiments

EXPOSE 8080 8765