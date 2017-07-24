# InstanceDockerImage

# External files

Please keep these files updated.

- runner: https://raw.githubusercontent.com/JoyOI/Runner/master/runner

# Build docker image manually

``` text
docker build -t joyoi-base ../InstanceDockerImageBase
docker build -t joyoi .
```

# Remote docker image

Docker image on docker hub are updated with this repository:<br/>
https://hub.docker.com/r/yuko/joyoi/
