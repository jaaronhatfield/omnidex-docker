FROM centos:6.10
LABEL maintainer="Aaron Hatfield <aaron@aaronhatfield.com>"
LABEL version="2019.19.0"

ARG RPM

WORKDIR ~

RUN \
    yum -y install unzip wget && \
    wget -O omnidex.rpm ${RPM} && \
    rpm -ivf omnidex.rpm && \
    rm omnidex.rpm
