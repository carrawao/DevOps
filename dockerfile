FROM python:3.6.1-alpine

ARG buildDate
LABEL buildDate=$buildDate

ENV DEBIAN_FRONTEND noninteractive

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup
RUN echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache

RUN echo $'#!/bin/sh\nexit 101' > /usr/sbin/policy-rc.d
RUN chmod +x /usr/sbin/policy-rc.d

RUN \
  apt-get update && \
  apt-get -y install \
        software-properties-common \
        vim \
        pwgen \
        unzip \
        curl \
        python3-pip \
        git-core && \
  rm -rf /var/lib/apt/lists/* \
  pip3 install -r devops/requirements.txt