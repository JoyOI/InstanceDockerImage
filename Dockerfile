FROM daocloud.io/ubuntu:16.04

WORKDIR /workdir
COPY ./runner /usr/bin
COPY ./run-actor.sh /workdir
COPY ./actor.csproj /workdir/actor/

RUN chmod +x /usr/bin/runner

RUN sed -i 's/archive.ubuntu.com/cn.archive.ubuntu.com/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get install software-properties-common curl -y
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get update
RUN apt-get install gcc g++ nodejs fp-compiler python3 python3-psutil -y

RUN echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ xenial main" > /etc/apt/sources.list.d/dotnetdev.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893
RUN apt-get update
RUN apt-get install dotnet-sdk-2.0.0-preview2-006497 -y

RUN cd /workdir/actor && dotnet restore && cd ..
