FROM daocloud.io/ubuntu:16.04

WORKDIR /workdir
COPY ./runner /usr/bin

RUN mkdir -p /workdir
RUN chmod +x /usr/bin/runner

RUN sed -i 's/archive.ubuntu.com/cn.archive.ubuntu.com/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get install software-properties-common curl -y
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get update
RUN apt-get install gcc g++ nodejs fp-compiler python3 python3-psutil -y
