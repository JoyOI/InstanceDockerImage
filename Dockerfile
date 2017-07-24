FROM joyoi-base

WORKDIR /workdir

COPY ./runner /usr/bin
COPY ./run-actor.sh /actor/
COPY ./actor.csproj /actor/
COPY ./Program.cs /actor/

RUN chmod +x /usr/bin/runner
RUN chmod +x /actor/run-actor.sh
RUN chmod 755 -R /actor
RUN chmod 777 -R /workdir

RUN useradd -m runner
RUN echo "runner hard nice 19" >> /etc/security/limits.conf
RUN echo "runner hard nproc 128" >> /etc/security/limits.conf
RUN echo "root:$(cat /dev/urandom | head -c 30 | base64)" | chpasswd

RUN cd /actor && dotnet restore && dotnet build && cd ..
