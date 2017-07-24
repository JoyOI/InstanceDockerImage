FROM yuko/joyoi-base

WORKDIR /workdir
COPY ./runner /usr/bin
COPY ./run-actor.sh /workdir
COPY ./actor.csproj /workdir/actor/
COPY ./Program.cs /workdir/actor/

RUN chmod +x /usr/bin/runner
RUN chmod +x /workdir/run-actor.sh

RUN cd /workdir/actor && dotnet restore && dotnet build && cd ..
